df1 <- read.csv('문화여가시설_만족도_20221017172412.csv', fileEncoding = 'euc-kr')
View(df1)
getwd()
setwd('C:/Users/Bowon Kang/Desktop/code')
install.packages('dplyr')
install.packages('ggplot2')
library(dplyr)
library(ggplot2)
df1<- rename(df1, title1='구분별.1.',
             title2='구분별.2.',
             vg='X2021',
             g='X2021.1',
             s='X2021.2',
             b='X2021.3',
             vb='X2021.4')
df1<- df1 %>% filter(title1=='연령별')
View(df1)
colnames(df1)


test1<- data.frame(name=c(rep('15세~19세',times=5),
                          rep('20세~29세',times=5),
                          rep('30세~39세',times=5),
                          rep('40세~49세',times=5),
                          rep('50세~59세',times=5),
                          rep('60세이상',times=5)),
                   type=c(rep(c('매우만족','만족','보통','불만족','매우불만족'),times=6)),
                          value=c(a,b,c,d,e,f))
View(test1)                              


# 6.1,18.0,45.8,24.1,6.0,
# 3.7,18.1,45.9,24.8,7.5,
# 4.3,17.2,49.3,23.3,5.9,
# 3.7,17.0,53.4,20.8,5.2,
# 3.2,15.8,61.9,16.1,2.9))

                   
test2<-t(df1)
View(test2)
as.numeric(test2[c(3:7),1])->a
as.numeric(test2[c(3:7),2])->b
as.numeric(test2[c(3:7),3])->c
as.numeric(test2[c(3:7),4])->d
as.numeric(test2[c(3:7),5])->e
as.numeric(test2[c(3:7),6])->f

f

y<- ggplot(data=test1, aes(x=name, y=value,fill=type))+ geom_bar(stat='identity',position=position_dodge())+
  geom_text(aes(label=value),vjust=1.1,color='black',position=position_dodge(0.9),size=3)+
  scale_fill_brewer(palette='Paired')+
    coord_cartesian(ylim=c(0,65))+
    labs(
      title='연령별 문화여가시설 만족도 조사',
      x='연령대',
      y='만족도 비율',
    )
### position=position_dodge() : 막대기들을 합치지 않고 나타내기
### geom_text() : 그래프 안에 까만색 숫자로 비율 나타낸것, position=position_dodge(0.9) : 까만 숫자의 위치
### scale_fill_brewer(paletter='Paired'): 그래프 색 이쁘게 해줌
### coor_cartesian : 전체적 그래프의 y축 면적 조정

windows()   
y
