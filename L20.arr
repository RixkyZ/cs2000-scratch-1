use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

my-list = [list: 5,7,6,8,3]


#first(r) is the first number in the list, rest(r) is the rest of the list

fun add-till-zero(l :: List<Number>) -> Number:
  doc:"adds numbers in the list before zero"
  cases(List) l:
    | link(f,r) => 
      if f == 0:
        0
      else:
        f + add-till-zero(r)
      end
    | empty => 0
  end
where:
  add-till-zero([list:5,7,0,3]) is 5 + add-till-zero([list:7,0,3]) #was 12, then 5 + 7
  add-till-zero([list:7,0,3]) is 7 + add-till-zero([list:0,3])
  add-till-zero([list:0,3]) is 0
  add-till-zero([list:]) is 0
end


fun find-error-suffix(l :: List<String>) -> List<String>:
  doc:"returns an empty list if the list does not have "error", other wise it will return what ever starts with "error""
  cases(List) l:
    |empty => empty
  end
|link(f,r) =>
  if f == "error":
    link("error", find-erroe-suffix(r))
  else:
    [list:]
  end
where:
  find-error-suffix([list:"this","error","is","critical"]) is 