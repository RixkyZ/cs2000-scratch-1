use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

  items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
    row: "Sword of Dawn",           23,  -87
    row: "Healing Potion",         -45,   12
    row: "Dragon Shield",           78,  -56
    row: "Magic Staff",             -9,   64
    row: "Elixir of Strength",      51,  -33
    row: "Cloak of Invisibility",  -66,    5
    row: "Ring of Fire",            38,  -92
    row: "Boots of Swiftness",     -17,   49
    row: "Amulet of Protection",    82,  -74
  row: "Orb of Wisdom",          3,  4
end
    
fun calc-distance(r :: Row) -> Number:
  doc: "finds distance to origin from fields 'x-coordinate' and 'y-coordinate'"
  num-sqrt(num-sqr(get-column(r, "x-coordinate")) + num-sqr(get-column(r, "y-coordinate")))
where:
  calc-distance(get-row(items, 0)) is-roughly num-sqrt(num-sqr(23) + num-sqr(-87))
  calc-distance(get-row(items, 3)) is-roughly num-sqrt(num-sqr(-9) + num-sqr(64))
  calc-distance(get-row(items,9)) is 5
end

with-dis = build-column(items, "distance", calc-distance)

fun subtract-20(n :: Number) -> Number:
  doc:"subtracts 20"
  n - 20
where:
  subtract-20(0) is -20
  subtract-20(15) is -5
end
d1 = transform-column(items, "x-coordinate", subtract-20)
fun TenP-D(n :: Number) -> Number:
  doc:"10% down for both x and y coordinates"
  n * 0.9
where:
  TenP-D(10) is 9
  TenP-D(20) is 18
end

d2 = transform-column(items,"x-coordinate",TenP-D)
d3 = transform-column(d2,"y-coordinate",TenP-D)

fun earnings-to-number(s :: String) -> Number:
  doc: "Converts a possibly comma-formatted earnings string to a number, using 0 if empty or invalid"
  string-to-number-default(0)(string-replace(s, ",", ""))
where:
  earnings-to-number("1234") is 1234
  earnings-to-number("1,234") is 1234
  earnings-to-number("-1.3") is -1.3
  earnings-to-number("hello") is 0
end