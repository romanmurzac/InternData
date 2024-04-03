import pandas as pd
import pandasql as ps
import time

def get_etl(raw_data, transformation, trusted_data):
    #extract DATA
    data=pd.read_csv(raw_data)

    #transform DATA
    with open(transformation) as file:
        query = file.readline()
    data = ps.sqldf(query, locals())

    #load DATA
    data.to_csv(trusted_data, index=False)
    pipeline_name = transformation.split('.')[0].split("/")[-1]
    print(f"ETL pipeline {pipeline_name} executed successfully.")

if __name__ == "__main__":

    pipelines = ["users", "personal_data", "account", "place"]

    while True:
        for pipeline in pipelines:
            raw_layer = "Stage_3/Holtea_Delia/data/raw_zone/db_holtea-delia_raw.csv"
            transform = f"Stage_3/Holtea_Delia/src/Transformations/{pipeline}.sql"
            trusted_layer = f"Stage_3/Holtea_Delia/data/trusted_zone/db_{pipeline}_trusted.csv"

            get_etl(raw_layer, transform, trusted_layer)

        time.sleep(15)    
        

