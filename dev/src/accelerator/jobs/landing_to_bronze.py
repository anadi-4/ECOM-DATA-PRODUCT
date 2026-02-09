from pyspark.sql import SparkSession
from accelerator.utils.csv_reader_utility import read_csv
import yaml
import os


config_path = "src/accelerator/utils/config_utility.yaml"

try:
    with open(config_path,'r') as config_file:
        configs = yaml.load(config_file, Loader = yaml.FullLoader)
except FileNotFoundError as e:
    print(e)

app_name = configs['app']['name']
spark_app_name = configs['spark']['app_name']
spark_master= configs['spark']['master']

spark = SparkSession.builder.master(spark_master).appName(spark_app_name).getOrCreate()

additional_configs = {
    "header":True,
    "delimiter":",",
    "multiline":True,
    "inferSchema":True

}

source_file_path = 'data/landing/olist_customers_dataset.csv'
csv_test_df = read_csv(spark,source_file_path,**additional_configs)

csv_test_df.show()
