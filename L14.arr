use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

import lists as L

discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]

discount-codes-upper = L.map(lam(s :: String) -> String: string-to-upper(s) end, discount-codes)

fun is-valid(s :: String) -> Boolean:
  doc:" check is the code were NONE"
  not(s == "NONE")
where:
  is-valid("VIP") is true
  is-valid("NONE") is false
end

real-codes = L.filter(is-valid,discount-codes-upper)

L.distinct(real-codes)

survey-responds = [list: "yes", "NO", "maybe", "Yes", "no", "Maybe"]

survey-responds-lower = L.map(lam(s :: String) -> String: string-to-lower(s) end, survey-responds)

fun only-df(s :: String) -> Boolean:
  doc: "Returns true when s is not MAYBE."
  not(s == "MAYBE")
where:
  only-df("MAYBE") is false
  only-df("YES") is true
  only-df("NO") is true
end

df-res = L.filter(only-df,survey-responds-lower)

L.distinct(df-res)

  products =
  table: name :: String, price :: Number
    row: "laptop", 999.99
    row: "mouse", 25.50
    row: "keyboard", 75.00
    row: "monitor", 299.99
  end



[list: "apple", "banana", "cherry", "date", "elderberry"]

fun kl(t :: Number, ms :: Number) -> String:
  doc:"1"
  if ms >= t:
    "Stop"
  else:
    "continue"
  end
where:
  kl(30, 40) is "Stop"
  kl(30, 25) is "continue"
  kl(70, 70) is "Stop"
end