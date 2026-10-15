use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

weather-data =
  table: date, temperature, precipitation
    row: "2025-01-01", 62, 0.1
    row: "2025-01-02", "45", 3
    row: "2025-01-03", 28, 0.2
    row: "2025-01-04", 55, -1
    row: "2025-01-05", 90, 0
  end

# create test table
wea-t1 =
  table: temperature
    row: 62
    row:"45"
    row: 28
    row: 55
    row: "90"
    row: 3
  end
# define cold/mid/hot cold: <50, mild 50-70, hot >70
fun nor-temp(v) -> Number:
  doc:"convert temp to number if its a string"
  if is-string(v):
    string-to-number-unsafe(v)
  else:
    v
  end
where:
  nor-temp(87) is 87
  nor-temp("21") is 21
end

a = transform-column(wea-t1,"temperature",nor-temp)

# normalize the temperature column
fun temp-t(temp :: Number) -> String:
  doc:"descriptive message of temperature"
  if temp < 50: "cold"
  else if
    temp <= 70: "mild"
  else:
     "hot"
  end
where:
    temp-t(80) is "hot"
    temp-t(12) is "cold"
    temp-t(50) is "mild"
  end

# build the column

with-m = build-column(a, "temp-t", lam(r :: Row) -> String: temp-t(get-column(r, "temperature")) end)

# bar chart
freq-bar-chart(with-m, "temp-t")

#CW1:

fun rain-ort(rain :: Number) -> String