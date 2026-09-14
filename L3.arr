use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

green-orect=rectangle(80,65,"outline","green")
purple-srect=rectangle(95,68,"solid","purple")
tall-psrect=above(purple-srect,purple-srect)
o-tri=triangle(85,"solid","orange")
side-length=80
s-color="red"
c-radius = 35
red-square = square(side-length,"solid",s-color)
sy-c = circle(c-radius
  ,"solid","yellow")
b-rect-wd = 80
b-rect-sl = 110
b-rect = rectangle(b-rect-sl,b-rect-wd
  ,"solid","black")
sbs-c = beside(sy-c,sy-c)
logo-t = text("Target",50,"black")
c1 = circle(80,"solid","red")
c2 = circle(60,"solid","white")
c3= circle(40,"solid","red")
logo = overlay(c3,overlay(c2,c1))
