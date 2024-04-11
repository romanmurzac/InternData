import pandas as pd
import pandasql as ps
import time

#define ETL

def get_etl(raw_data, transformation, trusted_data):
    #extract data
    data = pd.read_csv(raw_data)

    #transform data
    with open(transformation) as file:
        query = file.read()

    print("Query before execution:")
    print(query)  

    try:
        data = ps.sqldf(query, locals())
    except Exception as e:
        print("Error during SQL execution:", e)

    if data is None:
        print("Warning: Transformation produced no result.")
    else:
        #load data
        data.to_csv(trusted_data, index=False)

        pipeline_name = transformation.split('.')[0].split("/")[-1]
        print(f"ETL pipeline {pipeline_name} executed successfully.")



if __name__ == "__main__":

    pipelines = ["users", "personal_info", "economic_info", "computer_info"]

    while True:
        for pipeline in pipelines:
            raw_layer = r"C:\Users\andra\Intern Data Project\InternData\Stage_3\Musat_Andra\data\raw_zone\db_inda_musat_andra_raw.csv"
            transform = fr"C:\Users\andra\Intern Data Project\InternData\Stage_3\Musat_Andra\src\transformations\{pipeline}.sql"
            trusted_layer = fr"C:\Users\andra\Intern Data Project\InternData\Stage_3\Musat_Andra\data\trusted_zone\db_{pipeline}_trusted.csv"

            get_etl(raw_layer, transform, trusted_layer)

        time.sleep(15)    
        
        
