use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


fun double(n :: Number) -> Number:
  doc: "Returns twice the input number"
  n * 2
where:
  double(5) is 10
  double(0) is 0
  double(-3) is -6
end

fun is-hot(temp :: Number) -> Boolean:
  doc: "Checks whether the temperature is above 30"
    temp > 30
where:
  is-hot(29) is false
  is-hot(30) is false
  is-hot(31) is true
end

fun grade(score :: Number) -> String:
  doc: "Classifies a student's score"
  if score >= 90:
    "Excellent"
  else if score >= 60:
    "Pass"
  else:
    "Fail"
  end
where:
  grade(50) is "Fail"
  grade(60) is "Pass"
  grade(89) is "Pass"
  grade(90) is "Excellent"
end

fun final-price(price :: Number, member-1 :: Boolean) -> Number:
  doc: "Calculates the final price based on membership"
  if member-1:
    price * 0.8
  else:
    price * 1
  end
where:
  final-price(100, true) is 80
  final-price(100, false) is 100
  final-price(50, true) is 40
end

fun ticket-price(age :: Number, member-2 :: Boolean) -> Number:
  doc: "Calculates ticket prices based on age and membership"
  bp = 
    if age < 12:
      5
    else if
      age <= 64:
      12
    else:
      8
    end
  if member-2:
    bp - 2
  else:
    bp
  end
where:
  ticket-price(10, false) is 5
  ticket-price(10, true) is 3
  ticket-price(20, false) is 12
  ticket-price(20, true) is 10
  ticket-price(65, false) is 8
  ticket-price(65, true) is 6
end

fun scholarship(gpa :: Number, credits :: Number, recommendation :: Boolean) -> Boolean:
  doc: "Checks whether a student qualifies for a scholarship"
  bpr =
    if (gpa >= 3.5) and (credits >= 30):
      true
    else:
      false
    end
  if recommendation:
    true
  else:
    bpr
  end
where:
  scholarship(3.8, 40, false) is true
  scholarship(3.2, 40, false) is false
  scholarship(3.2, 20, true) is true
  scholarship(3.8, 20, false) is false
end


fun calculate-tax(price :: Number) -> Number:
  doc: "Calculates the total price including 6.25% sales tax"
  (price * 0.0625) + price
where:
  calculate-tax(100) is 106.25
  calculate-tax(200) is 212.5
end

fun can-vote(age :: Number, citizen :: Boolean) -> Boolean:
  doc: "Checks whether someone meets the age and citizenship requirements"
  if (age >= 18) and (citizen):
      true
    else:
      false
    end
where:
  can-vote(20, true) is true
  can-vote(17, true) is false
  can-vote(20, false) is false
end

fun welcome-message(name :: String) -> String:
  doc: "Creates a personalized welcome message"
  string-append(string-append("Welcome, ", name),"!")
where:
  welcome-message("RK") is "Welcome, RK!"
  welcome-message("Alice") is "Welcome, Alice!"
end

fun shipping-fee(price :: Number) -> Number:
  doc: "Determines shipping fees based on order total"
  if price >= 75:
    0
  else if price >= 30:
    5
  else:
    10
  end
where:
  shipping-fee(20) is 10
  shipping-fee(30) is 5
  shipping-fee(74) is 5
  shipping-fee(75) is 0
end

fun admission(age :: Number, parent :: Boolean) -> Boolean:
  doc: "Checks whether someone is allowed to enter an event"
  if (age >= 18) or (parent):
    true
  else:
    false
  end
where:
  admission(20, false) is true
  admission(16, true) is true
  admission(16, false) is false
  admission(18, false) is true
end

#1
fun fi-price(price :: Number, member-3 :: Boolean) -> Number:
  doc: "calculates the final price based on membership and price"
  wm =
    if member-3:
    price * 0.8
  else:
    price
  end
    if price > 100:
    wm - 10
    else:
    wm
    end
where:
  fi-price(100, true) is 80
  fi-price(150, true) is 110
  fi-price(90, false) is 90
  fi-price(150, false) is 140
end

#3
fun can-enter(
    age :: Number,
    has-ticket :: Boolean,
    vip :: Boolean) -> Boolean:
  doc: "checks whether a person can enter the event"
  nc = (age >= 18) and (has-ticket)
  if age < 16:
    false
  else: 
    (vip) or (nc)
    end   
  where:
  can-enter(20, true, false) is true
  can-enter(20, false, false) is false
  can-enter(17, false, true) is true
  can-enter(15, true, true) is false
  can-enter(18, true, false) is true
end

fun ab(num :: Number) -> Number:
  doc:"1"
  if num >= 0: 
    num
  else:
    -1 * num
  end
where:
  ab(-5) is 5
  ab(5) is 5
  ab(0) is 0
end

