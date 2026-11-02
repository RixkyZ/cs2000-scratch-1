use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

# fun ---(-- :: List) -> ---:
#  doc:"-------"
#  cases(List) -:
# |empty => ---
# |link(first,rest) => 
#  --first--
#  foo(rest)
#  end

#|
fun num-list-fun(nl :: NumList) -> ???:
  cases (NumList) nl:
    | nl-empty => ...
    | nl-link(first, rest) =>
      ... first ...
      ... num-list-fun(rest) ...
  end
end
|#


data NumList:
  | nl-empty
  | nl-link(first :: Number, rest :: NumList)
end

my-numlist = nl-link(6,nl-link(7,nl-link(8,nl-empty)))


fun num-7s(nl :: NumList) -> Number:
  cases (NumList) nl:
    | nl-empty => 0
    | nl-link(first, rest) =>
      if first == 7:
        1 + num-7s(rest)
      else:
        0 + num-7s(rest)
      end
  end
where:
  num-7s(my-numlist) is 1
end

#Prac 1
fun contains-n(nl :: NumList, n :: Number) -> Boolean:
  doc:"returns true is n is the numlist"
  cases (NumList) nl:
    | nl-empty => false
    | nl-link(first,rest) =>
      (first == n) or contains-n(rest,n)
  end
where:
 contains-n(nl-link(6, nl-link(7, nl-link(8, nl-empty))), 6) is true
  contains-n(nl-link(7, nl-link(8, nl-empty)), 6) is false
end

#Prac 2
fun total-sum(nl :: NumList) -> Number:
    doc:"returns the sum of all numbers in a Numlist"
    cases (NumList) nl:
      | nl-empty => 0
      | nl-link(first,rest) =>
        first + total-sum(rest)
    end
    where:
    total-sum(nl-link(6, nl-link(7, nl-link(8, nl-empty)))) is
    6 + total-sum(nl-link(7, nl-link(8, nl-empty)))
    
  total-sum(nl-link(7, nl-link(8, nl-empty))) is
    7 + total-sum(nl-link(8, nl-empty))
    
    total-sum(nl-empty) is 0
end

#Prac 3
fun remove-3(nl :: NumList) -> NumList:
  doc:"remove 3 if it's in the numlist"
  cases (NumList) nl:
    | nl-empty => nl-empty
    | nl-link(first,rest) => 
      if first == 3:
        remove-3(rest)
      else:
        nl-link(first,remove-3(rest))
      end
  end
where:
remove-3(nl-link(1, nl-link(3, nl-link(5, nl-empty)))) is nl-link(1, nl-link(5, nl-empty))

remove-3(nl-link(3, nl-link(3, nl-link(6, nl-empty)))) is nl-link(6, nl-empty)
end

#Prac 4

data NumListList:
  |nll-empty
  |nll-link(first :: NumList,rest :: NumListList)
end

