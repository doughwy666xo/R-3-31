install.packages("ggplot2")
library(ggplot2)
install.packages("palmerpenguins")
library(palmerpenguins)
data("penguins")

#檢視次數分配
table(penguins$sex)
table(penguins[,"sex"])

t1<-table(penguins$sex,
          dnn= "企鵝性別",
          useNA = "ifany")
t1
class(t1)

#proportions

p1<-round(proportions(t1)*100,2)
p1
class(p1)

#cbine
t1p<-cbind(Freq = t1, Percent= p1)
t1p
class(t1p)



#prac1
m1<-table(msleep$vore,
          dnn="食性",
          useNA="ifany")
m2<-table(msleep$conservation,
          dnn="物種保護狀況",
          useNA="ifany")

m1
m2
class(m1)
class(m2)

#prac2
if(!require("flextable")){install.packages("flextable")}
library(flextable)

as_flextable(m1)
as_flextable(m2)

s1<-table(subset$v10,
          dnn="一天沒上網玩就會很難受",
          useNA="ifany")


install.packages("car")
library(car)

class(subset$v10)



subset$Internet<-recode(as.numeric(subset$v10),
           "1 = '非常不符合';
           2 = '不符合';
           3 = '符合';
           4 = '非常符合';
           98='未回答/拒答'",
           levels = c("非常不符合","不符合","符合","非常符合","未回答/拒答"),
           as.factor = T)

t2<-as_flextable(table(subset$Internet,
             dnn="沒上網難受",
             useNA="ifany"))

install.packages("patchwork")
library(patchwork)
install.packages("showtext")
library(showtext)
showtext_auto()
g1<-ggplot(subset, aes(Internet))+
  geom_bar(fill = "blue", color = "black")
g1
g1+wrap_flextable(t2,just="center")

