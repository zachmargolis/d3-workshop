d3.v3.min.js:
	curl https://d3js.org/d3.v3.min.js > d3.v3.min.js

citibike-201401.csv:
	# download CSV
	curl https://s3.amazonaws.com/tripdata/201401-citibike-tripdata.zip > 201401-citibike-tripdata.zip
	# unzip it
	unzip 201401-citibike-tripdata.zip
	# rename it to something without spaces
	mv "2014-01 - Citi Bike trip data.csv" citibike-201401.csv

.PHONY: downloads clean

downloads: d3.v3.min.js citibike-201401.csv

clean:
	rm -rf d3.v3.min.js citibike-201401.csv 201401-citibike-tripdata.zip

server: downloads
	python -m SimpleHTTPServer

