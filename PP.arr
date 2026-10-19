use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

# Part1
# Chips = 1.5
# water = 1
# Candy = 1.25

fun item-price(item :: String) -> Number:
  doc:"give back the price when the item chips, water,candy"
  if item == "Chips":
    1.5
  else if item == "Candy":
    1.25
  else:
    1
  end
where:
  item-price("Chips") is 1.5
  item-price("Candy") is 1.25
  item-price("Water") is 1
end

#Part2
fun is-enough(item :: String, paid :: Number) -> Boolean:
  doc:"determines whether the amount of the money is enough to purchase the items"
  paid >= item-price(item)
where:
  is-enough("Chips",2) is true
  is-enough("Candy",1) is false
  is-enough("Water",1) is true
  is-enough("Chips",0) is false
end

#Part3
fun change(paid :: Number, item :: String) -> Number:
  doc:"calculate the change for the item paid"
  if ( paid - item-price(item)) < 0:
  0
  else:
    paid - item-price(item)
  end
where:
  change(3,"Chips") is 1.5
  change(1.25,"Candy") is 0
  change(0,"Water") is 0
end

#Part 4
fun display-1(paid :: Number, item :: String) -> String:
  doc:" display the change or how much money is neede when purchasing item"

  if paid >= item-price(item):
    
  "CHANGE $" + num-to-string-digits(change(paid,item),1)
  else:
    "NEED $" + num-to-string-digits((item-price(item) - paid),1)
  end
  
where:
  display-1(2,"Chips") is "CHANGE $0.5"
  display-1(1.25,"Candy") is "CHANGE $0.0"
  display-1(0.5,"Water") is "NEED $0.5"
end

#Part5
fun slot-image(item :: String) -> Image:
  doc:"returns image when purchasing item"
  Chips-color = "green"
Candy-color = "pink"
Water-color = "blue"

Chips-outline = rectangle(180,120,"outline",Chips-color)
Candy-outline = rectangle(180,120,"outline",Candy-color)
Water-outline = rectangle(180,120,"outline",Water-color)

  Chips-text = text("Chips",40,Chips-color)
  Candy-text = text("Candy",40,Candy-color)
  Water-text = text("Water",40,Water-color)
  if item == "Chips":
    overlay(Chips-text,Chips-outline)
    else if item == "Candy":
    overlay(Candy-text,Candy-outline)
  else:
    overlay(Water-text,Water-outline)
  end
end