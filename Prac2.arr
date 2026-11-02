use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

#Skill 2
#Prac 1 
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

#Prac 2
fun find-drought-risks(t :: Table) -> Table:
  doc:"1"
  
  fun rfd(r :: Row) -> Boolean:
    get-column(r,"rainfall-2024") < get-column(r,"rainfall-2023")
  end
  
  filter-with(t,rfd)
  
where:
  sample2 = table: region :: String, rainfall-2023 :: Number, rainfall-2024 :: Number
    row: "Shanghai",4,3
    row: "Nanjing",4,8
    row: "Suzhou",2,0
    row: "Nanchang",3,3
  end
  
  expected1 = table: region :: String, rainfall-2023 :: Number, rainfall-2024 :: Number
    row: "Shanghai",4,3
    row: "Suzhou",2,0
  end
  
  find-drought-risks(sample2) is expected1
end

#Prac3
students = table: name :: String, score :: Number
  row: "Alex", 85
  row: "Mia", 92
  row: "Leo", 67
end

fun get-score(t :: Table, index :: Number) -> Number:
  doc: "Returns the score of the student at the given row index."
  student-row = get-row(t,index)
  get-column(student-row,"score")
where:
  get-score(students, 0) is 85
  get-score(students, 1) is 92
  get-score(students, 2) is 67
end

#Prac4

fun discount-prices(t :: Table) -> Table:
  doc:"1"
  
  fun dp(p :: Number) -> Number:
    p * 0.8
  end
  
  transform-column(t,"price",dp)
  
where:
  sample-4 = table: name :: String, price :: Number
    row: "Chips", 100
    row: "Coke", 20
    row: "Chicken", 130
  end
  
  expected-1 = table: name :: String, price :: Number
    row: "Chips", 80
    row: "Coke", 16
    row: "Chicken", 104
  end
  
  discount-prices(sample-4) is expected-1
end

#Prac5
fun add-order-total(t :: Table) -> Table:
  doc:"1"
  
  fun tp(r :: Row) -> Number:
    get-column(r,"price") * get-column(r,"quantity")
  end
  
  build-column(t,"total",tp)
  
where:
  sample-2 = table: item :: String, price :: Number, quantity :: Number
    row: "Salad", 8, 5
    row: "Steak", 20, 10
    row: "Cheese Cake", 15, 3
  end
  
  epd = table: item :: String, price :: Number, quantity :: Number, total :: Number
    row: "Salad", 8, 5, 40
    row: "Steak", 20, 10, 200
    row: "Cheese Cake", 15, 3, 45
  end
  
  add-order-total(sample-2) is epd
end

#Prac6
fun find-low-stock(t :: Table) -> Table:
  doc:"filter out the items that has stock lower than the required amount"
  
  fun fms(r :: Row) -> Boolean:
    get-column(r,"stock") < get-column(r,"minimum")
  end
  
  filter-with(t,fms)
  
where:
  
  tes1 = table: item :: String, stock :: Number, minimum :: Number
    row: "Chips",10,5
    row: "Candy",2,10
    row: "Banana",20,20
  end
  
  ept = table: item :: String, stock :: Number, minimum :: Number
    row: "Candy",2,10
  end
  
  find-low-stock(tes1) is ept
end

#Prac7
fun add-bonus-points(t :: Table) -> Table:
  doc:"add an additional 5 points to every students within the table"
  
  fun add-points(score :: Number) -> Number:
    score + 5
  end
  
  transform-column(t,"score",add-points)
  
where:
  tes2 = table: name :: String, score :: Number
    row: "Lee",10
    row: "Qi",20
    row: "Bruce",30
  end
  
  exp3 = table: name :: String, score :: Number
    row: "Lee",15
    row: "Qi",25
    row: "Bruce",35
  end

  add-bonus-points(tes2) is exp3
end

fun cal-bmi(t :: Table) -> Table:
  doc:"1"
  
  fun c-bmi(r :: Row) -> Number:
    (get-column(r,"stock") / (get-column(r,"minimum") * get-column(r,"minimum")))
  end
  
  build-column(t,"bmi",c-bmi)
  
where:
  tes5 = table: item :: String, stock :: Number, minimum :: Number
    row: "Chips",10,5
    row: "Candy",2,10
    row: "Banana",20,20
  end
  
  EXP = table: item :: String, stock :: Number, minimum :: Number, bmi :: Number
    row: "Chips",10,5, 10 / (5 * 5)
    row: "Candy",2,10, 2 / (10 * 10)
    row: "Banana",20,20, 20 / (20 * 20)
  end
  
  cal-bmi(tes5) is EXP
end

