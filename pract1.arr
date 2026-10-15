use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

#1
fun free-shipping(price :: Number) -> Boolean:
  doc: "returns whether an order qualifies for free shipping"
  if price >= 50:
    true
  else:
    false
  end
where:
  free-shipping(30) is false
  free-shipping(50) is true
  free-shipping(75) is true
end

#2
fun weather-advice(temp :: Number) -> String:
  doc: "categorizes the temperature"
  if temp >= 80:
    "hot"
  else if
    temp >= 60:
    "warm"
  else if
    temp >= 40:
    "cool"
  else:
    "cold"
  end
where:
  weather-advice(90) is "hot"
  weather-advice(80) is "hot"
  weather-advice(65) is "warm"
  weather-advice(40) is "cool"
  weather-advice(25) is "cold"
end

#3
fun ticket-price(age :: Number, student :: Boolean) -> Number:
  doc: "calculates ticket price based on age and student status"
  if age < 12:
    10
  else if student:
    15
  else:
    20
  end
where:
  ticket-price(10, false) is 10
  ticket-price(10, true) is 10
  ticket-price(18, true) is 15
  ticket-price(18, false) is 20
end

#4
fun password-status(password :: String) -> String:
  doc: "categorizes a password based on its length"
  
  if string-length(password) < 6:
    "too short"
  else if
    string-length(password) <= 10:
    "okay"
  else:
    "strong"
  end
where:
  password-status("abc") is "too short"
  password-status("abcdef") is "okay"
  password-status("abcdefghij") is "okay"
  password-status("abcdefghijk") is "strong"
end

#5
fun final-price(price :: Number, coupon :: Boolean) -> Number:
  doc: "calculates the final price after applying a coupon"

  if (coupon) and (price >= 50):
    price - 10
  else if 
    (coupon) and (price < 50):
    price - 5
  else:
    price
  end
where:
  final-price(100, true) is 90
  final-price(50, true) is 40
  final-price(40, true) is 35
  final-price(100, false) is 100
end

#6
fun can-enter(age :: Number, has-ticket :: Boolean) -> Boolean:
  doc: "checks whether a person can enter the event"

  if (age >= 16) and (has-ticket): 
    true
  else:
    false
  end
where:
  can-enter(20, true) is true
  can-enter(16, true) is true
  can-enter(15, true) is false
  can-enter(20, false) is false
  can-enter(15, false) is false
end

#7
fun make-username(first :: String, last-1 :: String) -> String:
  doc: "creates a username from a first and last name"

  string-append(first, string-append(".",last-1))

where:
  make-username("Ricky", "Chang") is "Ricky.Chang"
  make-username("Alex", "Smith") is "Alex.Smith"
  make-username("A", "B") is "A.B"
end

#8

fun shipping-cost(weight :: Number, express :: Boolean) -> Number:
  doc: "calculates shipping cost based on weight and shipping type"

  wp = if weight <= 5:
    5
  else:
    10
  end
  if express:
    wp + 8
  else:
    wp
  end
where:
  shipping-cost(3, false) is 5
  shipping-cost(5, false) is 5
  shipping-cost(6, false) is 10
  shipping-cost(3, true) is 13
  shipping-cost(6, true) is 18
end

#9
fun final-grade(score :: Number, extra-credit :: Boolean) -> String:
  doc: "calculates a letter grade after possible extra credit"
  score-1 =
    if extra-credit:
      score + 5
  else:
      score
    end
  if score-1 >= 90:
      "A"
  else if score-1 >= 80:
      "B"
  else if score-1 >= 70:
      "C"
  else if score-1 >= 60:
      "D"
    else:
      "F"
    end
where:
  final-grade(92, false) is "A"
  final-grade(87, false) is "B"
  final-grade(87, true) is "A"
  final-grade(76, true) is "B"
  final-grade(55, false) is "F"
  final-grade(55, true) is "D"
end

#10
fun admission(age :: Number, member-1 :: Boolean, vip :: Boolean) -> Number:
  doc: "calculates movie admission price"

  np = 
    if age < 13:
  10
    else if age < 65:
      18
    else:
      12
    end
  if (member-1) and (vip):
    (np - 3) + 10
  else if member-1:
    np - 3
  else if vip:
    np + 10
  else:
    np
  end

where:
  admission(10, false, false) is 10
  admission(20, false, false) is 18
  admission(70, false, false) is 12
  admission(20, true, false) is 15
  admission(20, false, true) is 28
  admission(20, true, true) is 25
  admission(70, true, true) is 19
end

#11
fun move-x(x :: Number) -> Number:
  doc: "moves the x-coordinate 15 pixels to the right"
  x + 15
where:
  move-x(0) is 15
  move-x(20) is 35
  move-x(100) is 115
end

#12
fun move-player(x :: Number, key :: String) -> Number:
  doc: "moves the player based on the key pressed"
  if key == "a":
    x - 20
  else if key == "d":
    x + 20
  else:
    x
  end
where:
  move-player(100, "a") is 80
  move-player(100, "d") is 120
  move-player(100, "b") is 100
  move-player(50, "a") is 30
end

#13
WIDTH = 800
fun reached-end(x :: Number) -> Boolean:
  doc: "checks whether x has reached the right edge"
  if x >= WIDTH:
    true
  else:
    false
  end
where:
  reached-end(799) is false
  reached-end(800) is true
  reached-end(801) is true
  reached-end(0) is false
end

#14
fun can-withdraw(balance :: Number, amount :: Number, frozen :: Boolean) -> Boolean:
  doc: "checks whether a withdrawal is allowed"
  if (frozen) or (amount > balance):
    false
  else if (balance - amount) < 20:
    false
  else if amount == 0:
    false
  else:
    true
  end
where:
  can-withdraw(100, 50, false) is true
  can-withdraw(100, 80, false) is true
  can-withdraw(100, 81, false) is false
  can-withdraw(100, 50, true) is false
  can-withdraw(100, 0, false) is false
  can-withdraw(50, 60, false) is false
end
#15

fun delivery-fee(distance :: Number, member-2 :: Boolean, rush :: Boolean) -> Number:
  doc: "calculates a delivery fee"
  oe = if distance <= 5:
    5
  else if distance <= 10:
    8
  else:
    12
  end
  if (member-2) and (rush):
    (oe - 2 ) + 6
  else if member-2:
    oe - 2
  else if rush:
    oe + 6
  else:
    oe
  end
where:
  delivery-fee(3, false, false) is 5
  delivery-fee(5, false, false) is 5
  delivery-fee(6, false, false) is 8
  delivery-fee(10, false, false) is 8
  delivery-fee(11, false, false) is 12
  delivery-fee(3, true, false) is 3
  delivery-fee(6, false, true) is 14
  delivery-fee(11, true, true) is 16
end

# 16
fun scholarship(gpa :: Number, service-hours :: Number, probation :: Boolean) -> Boolean:
  doc: "determines whether a student qualifies for the scholarship"

  bqf = if (gpa >= 3.5) and (service-hours >= 20):
    true
  else if gpa > 3.8:
    true
  else:
    false
  end
  if probation:
    false
  else:
    bqf
  end
where:
  scholarship(3.6, 25, false) is true
  scholarship(3.5, 20, false) is true
  scholarship(3.5, 19, false) is false
  scholarship(3.9, 0, false) is true
  scholarship(3.9, 0, true) is false
  scholarship(3.6, 25, true) is false
end

#17
fun order-price(price :: Number, member-3 :: Boolean, express :: Boolean) -> Number:
  doc: "calculates the final order price after discounts and shipping"

  sp = if (member-3) and (price >= 100):
    price * 0.8
  else if member-3:
    price * 0.9
  else:
    price
  end
  if express:
    sp + 15
  else:
    sp
  end
where:
  order-price(200, true, false) is 160
  order-price(100, true, false) is 80
  order-price(80, true, false) is 72
  order-price(100, false, false) is 100
  order-price(200, true, true) is 175
  order-price(80, true, true) is 87
  order-price(100, false, true) is 115
end

fun course-result(score :: Number, attendance :: Number, honors :: Boolean) -> String:
  doc: "determines a student's final course result"

  bg = if score >= 90:
    "A"
  else if score >= 80:
    "B"
  else if score >= 70:
    "C"
  else if score >= 60:
    "D"
  else:
    "F"
  end
  if attendance < 70:
    "F"
  else if (honors) and (bg == "A"):
    "A+"
  else:
    bg
  end
where:
  course-result(95, 90, false) is "A"
  course-result(95, 90, true) is "A+"
  course-result(89, 90, true) is "B"
  course-result(75, 80, false) is "C"
  course-result(60, 70, false) is "D"
  course-result(100, 69, true) is "F"
  course-result(59, 100, false) is "F"
end

fun rental-cost(days :: Number, age :: Number, member-4 :: Boolean) -> Number:
  doc: "calculates the total cost of a car rental"
  brc = if days <= 3:
    50
  else if days <= 7:
    45
  else:
    40
  end
  if (age < 25) and (member-4):
    (30 + (-20 + (brc * days) ))
  else if age < 25:
    (brc * days) + 30
  else if member-4:
    (brc * days) - 20
  else:
    brc * days
  end
where:
  rental-cost(2, 30, false) is 100
  rental-cost(3, 30, false) is 150
  rental-cost(4, 30, false) is 180
  rental-cost(7, 30, false) is 315
  rental-cost(8, 30, false) is 320
  rental-cost(2, 20, false) is 130
  rental-cost(2, 30, true) is 80
  rental-cost(2, 20, true) is 110
  rental-cost(8, 20, true) is 330
end

fun baggage-fee(weight :: Number, elite-status :: Boolean, international :: Boolean) -> Number:
  doc: "calculates the baggage fee"
  bw = if weight <= 50:
    0
  else if weight <= 70:
    40
  else:
    100
  end
  if bw < 0:
    0
  else if 
    (elite-status) and (international):
    (bw - 20) + 30
  else if elite-status:
    bw - 20
  else if international:
    bw + 30
  else:
    bw
  end
where:
  baggage-fee(40, false, false) is 0
  baggage-fee(50, false, false) is 0
  baggage-fee(51, false, false) is 40
  baggage-fee(70, false, false) is 40
  baggage-fee(71, false, false) is 100

  baggage-fee(60, true, false) is 20
  baggage-fee(40, true, false) is 0

  baggage-fee(60, false, true) is 70
  baggage-fee(60, true, true) is 50
  baggage-fee(40, true, true) is 30
end