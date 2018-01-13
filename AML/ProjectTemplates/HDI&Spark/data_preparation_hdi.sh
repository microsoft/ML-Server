#!/usr/bin/env bash
cd /tmp
# Download data
wget https://github.com/Microsoft/ML-Server/raw/jasozha/aml/AML/ProjectTemplates/HDI%26Spark/data/AirlineSubsetCsv.tar.gz
wget https://github.com/Microsoft/ML-Server/raw/jasozha/aml/AML/ProjectTemplates/HDI%26Spark/data/WeatherSubsetCsv.tar.gz
# Make dir in HDFS
hadoop fs -mkdir -p /share
# Extract data to local FS and copy to HDFS
tar -xzf AirlineSubsetCsv.tar.gz
hadoop fs -put AirlineSubsetCsv /share
tar -xzf WeatherSubsetCsv.tar.gz
hadoop fs -put WeatherSubsetCsv /share
# Remove data in local FS
rm -rf AirlineSubsetCsv*
rm -rf WeatherSubsetCsv*
