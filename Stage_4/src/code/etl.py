# Import necessary modules
import pandas as pd
import pandasql as ps
import time

# Define ETL

def create_table(raw_data, transformation, trusted_data):

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


def execute_query(raw_data, transformation, limit):
    # E -> Extract data
    data = pd.read_csv(raw_data)

    # T -> Transform data
    with open(transformation) as file:
        query = file.readline()

    data = ps.sqldf(query, locals())

    # L -> Load data
    # print(data.head(limit))
    print(data.to_markdown())
