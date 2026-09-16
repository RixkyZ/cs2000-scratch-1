use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
# class practice 1
fun cake(color1 :: String,color2 :: String,color3 :: String) -> Image: doc: "create a three layer cake image" above(rectangle(80,60,"solid",color1),above(rectangle(80,60,"solid",color2),rectangle(80,60,"solid",color3))) end
fun cake2(c1 :: String,c2 :: String,c3 :: String) -> Image: 
doc: "create a three different size layer cake image"
top = rectangle(55,35,"solid",c1) 
mid = rectangle(65,45,"solid",c2) 
bottom = rectangle(80,60,"solid",c3) 
  above(top,above(mid,bottom))
end
# Class prectice 2
4 * (5 + (0.1 * 7))
