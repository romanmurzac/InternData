# Import necessary modules
import pandas as pd
import pandasql as ps
import time

# Define ETL

def get_etl(raw_data, transformation, trusted_data):
    # E -> Extract data
    data = pd.read_csv(raw_data)

    # T -> Transform data
    with open(transformation) as file:
        query = file.readline()

    data = ps.sqldf(query, locals())

    # L -> Load data
    data.to_csv(trusted_data, index=False)

    pipeline_name = transformation.split('.')[0].split("/")[-1]
    print(f"ETL pipeline {pipeline_name} executed successfully.")


if __name__ == "__main__":

    pipelines = ["users", "personal", "computer", "economic"]

    while True:
        for pipeline in pipelines:
            raw_layer = "Stage_3/Murzac_Roman/data/raw_zone/db_inda_murzac_roman_raw.csv"
            transform = f"Stage_3/Murzac_Roman/src/transformations/{pipeline}.sql"
            trusted_layer = f"Stage_3/Murzac_Roman/data/trusted_zone/db_{pipeline}_trusted.csv"

            get_etl(raw_layer, transform, trusted_layer)

        time.sleep(15)    
        