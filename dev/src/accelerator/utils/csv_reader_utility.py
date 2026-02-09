from pyspark.sql import SparkSession, DataFrame

def read_csv(sparksession:SparkSession,src_path:str, schema = None,**config_options) -> DataFrame:
    """
    Read a CSV file into a Spark DataFrame.

    This function configures a CSV DataFrameReader and returns the resulting
    DataFrame. It does not manage Spark lifecycle or execute any actions.

    If an explicit schema is provided, schema inference must be disabled.
    """

    if schema is not None and config_options.get("inferSchema",False):
        raise ValueError

    if schema is None:
        csv_df = sparksession.read.format('csv').options(**config_options).load(src_path)
    else:
        csv_df = sparksession.read.format('csv').schema(schema).options(**config_options).load(src_path)

    return csv_df

