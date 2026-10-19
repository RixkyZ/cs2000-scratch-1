use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun add-bad-year-column(t :: Table) -> Table:
  doc:"1"
  
  fun ibc(r :: Row) -> Boolean:
    get-column(r,"costs") > get-column(r,"revenues")
  end
  
  build-column(t,"bad-year",ibc)
  
where:
  sample1 = table: year :: String, costs :: Number, revenues :: Number
    row: "2026",100,120
    row: "2027",100,80
    row: "2028",100,100
  end
  
  expected = table: year :: String, costs :: Number, revenues :: Number, bad-year :: Boolean
    row: "2026",100,120, false
    row: "2027",100,80, true
    row: "2028",100,100, false
  end
  
  add-bad-year-column(sample1) is expected
end

