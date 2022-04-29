import json
from dataprofiler import Data, Profiler

# Auto-Detect & Load: CSV, AVRO, Parquet, JSON, Text
data = Data("station.csv")
# print(data.data.head(5)) # Access data directly via a compatible Pandas DataFrame

profile = Profiler(data)  # Calculate Statistics, Entity Recognition, etc
readable_report = profile.report(report_options={"output_format": "pretty"})
with open("outp.json", "w") as f:
    f.write(json.dumps(readable_report, indent=4))
