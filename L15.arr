use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

#notes: Initializing a variable: var x = 
# Update a variable: x := x + 30
# For each loop: (sequence) from each(_from_): ... end
#上一行里的第一个空格就是variable， 第二个是sequence

# Q1: Count the number of items in the bag
# Q2: Find the sum of numbers in the stack of stickers

#solution: initialize -> iterate -> update -> report the result

#implement: intiialize (0) -> iterate took each item from bag -> iterate: +1 when count

#Example
fun my-count(L :: List) -> Number block:
  doc:" counts the items in a list"
  var c = 0
  for each(i from L):
    c := c + 1
  end
  c
where:
  my-count([list:1,2,3,4]) is 4
end

#Prac1
fun pm(L :: List) -> Number block:
  doc:"mulitples the products together"
  var m = 1
  for each(p from L):
    m := m * p
  end
  m
where:
  pm([list:2,4,6,8]) is 384
end

#Prac2
fun sum-even-numbers(L :: List) -> Number block:
  doc:" only sum up even numbers within a list"
  var ev = 0
  for each(n from L):
    if num-modulo(n,2) == 0:
      ev := ev + n
    else:
      ev := ev
    end
  end
  ev
where:
  sum-even-numbers([list:1,2,3,4,5,6,7,8,]) is 20
end

#Prac4
fun any-negative(L :: List) -> Boolean block:
  doc:"detect wheater a list has at least one negative number or not"
  var nm = false
  for each(n from L):
    if n < 0:
      nm := true
    else:
      nm := nm
    end
  end
  nm
where:
  any-negative([list:2,3,5,6,-9,10]) is true
  any-negative([list:2,4,6,7,9]) is false
  any-negative([list:-2,0,1,2,3]) is true
end