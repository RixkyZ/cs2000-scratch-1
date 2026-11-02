use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

import lists as l

#Part 1

fun word-result(t :: String, e :: String) -> String:
  doc:"when typed world is the same as expected word is: exact, is the same besides capitalize is case, otherwise is wrong"
  if t == e:
    "exact"
  else if string-to-lower(t) == string-to-lower(e):
    "case"
  else:
    "wrong"
  end
where:
  word-result("cat","cat") is "exact"
  word-result("Boston","boston") is "case"
  word-result("hy","hi") is "wrong"
end

#Part 2

fun result(tl :: List<String>, el :: List<String>) -> List<String> block: 
  doc:"returns a list that has the result of word-result"
  var rt = [list:]
  for each(n from l.range(0, l.length(tl))) block:
    rt := rt + [list: word-result(l.get(tl, n), l.get(el, n))]
  end
  rt
where:
  result([list:],[list:]) is [list:]
  result([list: "The", "quick", "brown", "fox"], [list: "the", "quick", "brwn", "fox"]) is [list: "case", "exact", "wrong", "exact"]
  result([list: "hi"], [list: "hi"]) is [list: "exact"]
end

#Part 3
fun accuracy(tl :: List<String>, el :: List<String>) -> Number block:
  doc:"returns a percentage according to the accuracy of the typed words"
  var rst = 0
  
where:
  accuracy([list: "The", "quick", "brown", "fox"], [list: "the", "quick", "brwn", "fox"]) is 50
  accuracy([list: "red", "green", "blue", "gold"], [list: "red", "green", "blue", "Gold"]) is 75
  accuracy([list: "hi"], [list: "hi"]) is 100
  accuracy([list: "Yes"], [list: "yes"]) is 0
end
