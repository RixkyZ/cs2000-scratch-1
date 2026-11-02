use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

#skill 3
#p1
fun has-positive(l :: List<Number>) -> Boolean block:
  doc:"returns true if there is an positive number in the list"
  
  var result = false
  for each(n from l):
    result := result or (n > 0)
  end
  result
where:
  has-positive([list:-1,-3,-4,0]) is false
  has-positive([list:-1,-3,-4,0,8]) is true
  has-positive([list:]) is false
end
      

#p2
fun absolute-values(l :: List<Number>) -> List<Number> block:
  doc:"returns a new list of absolute number from the orginal list in the same order"
  var result = [list:]
  for each(n from l):
    result := result + [list:num-abs(n)]
  end
  result
where:
  absolute-values([list:-1,-3,-4,-5]) is [list:1,3,4,5]
  absolute-values([list:1,3,4,5]) is [list:1,3,4,5]
  absolute-values([list:]) is [list:]
end

#p3
fun exactly-three-chars(l :: List<String>) -> List<String> block:
  doc:"returns a new list that only has 3 character strings"
  var result = [list:]
  for each(s from l):
    when string-length(s) == 3:
      result := result + [list:s]
  end
  end
  result
where:
  exactly-three-chars([list:"apple","cat","banana"]) is [list:"cat"]
  exactly-three-chars([list:"dog","cat","ink"]) is [list:"dog","cat","ink"]
  exactly-three-chars([list:]) is [list:]
end

#p4
fun all-even(l :: List<Number>) -> Boolean block:
  doc:"returns true if all the number in the list is even, and true if empty"
  var result = true
  for each(n from l):
    when num-modulo(n,2) <> 0:
      result := false
    end
  end
  result
where:
  all-even([list: 2, 4, 6]) is true
  all-even([list: 2, 3, 4]) is false
  all-even([list: -4, 0, 8]) is true
  all-even([list: ]) is true
end

#p5:
fun sum-above(l :: List<Number>, t :: Number) -> Number block:
  doc:"1"
  var result = 0
  for each(n from l):
    when n > t:
      result := result + n
    end
  end
  result
where:
   sum-above([list: 2, 5, 8, 10], 5) is 18
  sum-above([list: 2, 5], 5) is 0
  sum-above([list: -3, -1, 2], -2) is 1
  sum-above([list: ], 5) is 0
end

#p6:
fun word-lengths(l :: List<String>) -> List<String> block:
  doc:"1"
  var result = [list:]
  for each(s from l):
    result := result + [list:string-length(s)]
  end
  result
where:
   word-lengths([list: "cat", "apple", "hi"]) is [list: 3, 5, 2]
  word-lengths([list: "", "a"]) is [list: 0, 1]
  word-lengths([list: ]) is [list: ]
end

#p7
fun has-long-word(l :: List<String>) -> Boolean block:
  doc:"1"
  var result = false
  for each(n from l):
    when (string-length(n)) > 5:
      result := true
    end
  end
  result
where:
  has-long-word([list: "cat", "banana", "hi"]) is true
  has-long-word([list: "apple", "dog"]) is false
  has-long-word([list: ]) is false
end

#p8:
fun all-passing(l :: list<Number>) -> Boolean block:
  doc:"1"
  var result = true
  for each(n from 1):
    when n <= 60:
      result := false
    end
  end
  result