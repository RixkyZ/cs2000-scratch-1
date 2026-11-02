use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

#Tow ways in achieving same function: However skill3 will be using the second method, which is the loop method:
fun my-doubles(l :: List<Number>) -> List<Number> block:
  doc:"return a new list with each number doubled"
  fun double(n :: Number) -> Number:
    n * 2
  end
  
  l.map(double)
  
where:
  my-doubles([list:1,10,30]) is [list:2,20,60]
end

fun my-doubles2(l :: List<Number>) -> List<Number> block:
      doc:"return a new list with each number doubled"
      var r = [list:]
  for each(n from l):
    r := r + [list: n * 2]
      end
      r
end
      

#Prac 
fun my-str-lens(l :: List<Number>) -> List<Number> block:
  doc:"return a new list with corresponding string lengths"
  var s-l = [list:]
    for each(string from l):
    s-l := s-l.append([list:string-length(string)])
  end
  s-l
where:
  my-str-lens([list:"hi","coffee"]) is [list:2,6]
end

#Prac
fun my-alternating(l :: List<Number>) -> List<Number> block:
  doc:"return a new list with alternate elements"
  
  var keep = false
  
  fun f-a(n :: Number) -> Boolean:
    keep := not(keep)
  end
  l.filter(f-a)
where:
  my-alternating([list: 1, 2, 3, 4, 5]) is [list: 1, 3, 5]
  my-alternating([list: 10, 20, 30, 40]) is [list: 10, 30]
  my-alternating([list:]) is [list:]
end