use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include csv

recipes = load-table:
  title :: String,
  servings :: Number,
  prep-time :: Number
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
end

crime-data =
  load-table:
    borough,
    major,
    minor,
    m202202,
    m202203,
    m202204,
    m202205,
    m202206,
    m202207,
    m202208,
    m202209,
    m202210,
    m202211,
    m202212,
    m202301,
    m202302,
    m202303,
    m202304,
    m202305,
    m202306,
    m202307,
    m202308,
    m202309,
    m202310,
    m202311,
    m202312,
    m202401
  source: csv-table-url("https://data.london.gov.uk/download/2zpjy/15ec4265-5102-49b9-bc74-0de4c8f7c682/Business%20Crime%20Borough%20Level.csv",default-options)
end

# get-row: Gives the function (Machine), get-row(x,y): Gives output (result)

#scratch a table method:
wp = table: date :: String,activity :: String ,duration :: Number ,protein :: Boolean
  row: "Sep 21","run",30,true
  row: "sep 22","gym",60,true
  row: "sep 23","none",0,false
end

