三种建表方式：

text建表语句：
CREATE TABLE ` trackdw `(
  `time` timestamp,
  `speed` int)
PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE
  'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
  'field.delim'='\t',
  'serialization.format'='\t')
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://kaxingzheha/apps/hive/warehouse/trackdw'


orc+snappy建表语句；
CREATE TABLE `trackdw`( 
  `time` timestamp,
  `speed` int
)PARTITIONED BY (
  `dt` string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY'\t'
STORED AS INPUTFORMAT
 'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat'
OUTPUTFORMAT
'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'
LOCATION
  'hdfs://kaxingzheha/apps/hive/warehouse/trackdw'
TBLPROPERTIES (
  'orc.compress'='SNAPPY')


parquet+snappy建表语句：
CREATE TABLE `trackdw`( 
  `time` timestamp,
  `speed` int
)PARTITIONED BY (
  `dt` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  'hdfs://kaxingzheha/apps/hive/warehouse/trackdw'
TBLPROPERTIES (
  'parquet.compression'='SNAPPY'
)