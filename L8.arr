use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include csv

#Table: Get-row: Function, Get-row(x,y): Row
#1 Function: filter-with

orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end

high-value-orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "10:15", 8.00
end

fun is-high-value(a :: Row) -> Boolean:
  doc:"determines whether if the order is high vakue or not"
  amt = get-column(a,"amount")
  if amt >= 8:
    true
  else:
    false
  end
    where:
  is-high-value(get-row(orders,0)) is true
  is-high-value(get-row(orders,5)) is false
end

check:
  filter-with(orders,is-high-value) is high-value-orders
end

#2: Function: order-by

#Class Excise
morning-orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
end

orders-d = order-by(orders,"time",false)

fun is-morning-orders(b :: Row) -> Boolean:
  doc:"determines whether the order is in morning or not"
  tm = get-column(b,"time") 
  if tm <= "12:00":
    true
  else:
    false
  end
where:
  is-morning-orders(get-row(orders-d,1)) is false
  is-morning-orders(get-row(orders-d,2)) is true
  is-morning-orders(get-row(orders-d,4)) is true
end
        
  check:
    filter-with(orders,is-morning-orders) is morning-orders
  end

ex1 = load-table: 
  location :: String,
  subject :: String,
  date :: String
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/7-photos.csv", default-options)
end

fun forest(s :: String, l :: String, d :: 