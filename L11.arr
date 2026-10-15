use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include csv
  
voter-data = 
  load-table: VoterID,FirstName,LastName,DOB,Party,Address,City,State,Zip,Phone,Email,LastVoted 
    source: csv-table-file("t1.csv", default-options)
end

filter-with(voter-data, lam(r :: Row) -> Boolean: get-column(r, "Party") == "Republican" end)

fun blank-to-indep(s :: String) -> String:
  doc: "replaces an empty string with Independent"
  if s == "":
    "Independent"
  else:
    s
  end
where:
  blank-to-indep("") is "Independent"
  blank-to-indep("blah") is "blah"
end

voters-with-indep = transform-column(voter-data, "Party", blank-to-indep)

#3
fun normalize-phone(p :: String) -> String:
  doc: "normalize phone numbers to (nnn..) format"
  if p == "": ""
  else:
    rd = string-replace(p, "-", "")
    rdt = string-replace(rd, ".", "")
    rbl = string-replace(rdt, "(", "")
    rbr = string-replace(rbl, ")", "")
    string-replace(rbr, " ", "")
  end
where:
  normalize-phone("") is ""
  normalize-phone("(555) 333-2222") is "5553332222"
  normalize-phone("555.987.6543") is "5559876543"
  normalize-phone("555-999-0000") is "5559990000"
  normalize-phone("5551234567") is "5551234567"
end

normalized-voter-table = transform-column(voter-data, "Phone", normalize-phone)

fun normalize-date-of-b(b :: String) -> String:
  doc: "normalize date of brith in (YYYY-MM-DD) format"
  if b == "": ""
  else:
    rd = string-replace(b, "/", "-")
    string-replace(rd, "/", "-")
  end
where:
  normalize-date-of-b("") is ""
  normalize-date-of-b("1975/12/05") is "1975-12-05"
  normalize-date-of-b("1978/07/08") is "1978-07-08"
end

normalized-voter-table = transform-column(, "Phone", normalize-phone)