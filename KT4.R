install.packages("readxl")
library(readxl)
D<-read_excel("problems_1.xlsx")
View(D)

Data<-D[2:length(D$ID),]
View(Data)

Data$ID[(Data$Year>=2016) & (Data$Year<=2019)]

D1<-data.frame(Data$AdmArea[Data$Year>=2016 & Data$Year<=2019],
               Data$Month[Data$Year>=2016 & Data$Year<=2019],
               Data$Year[Data$Year>=2016 & Data$Year<=2019],
               Data$TotalAmount[Data$Year>=2016 & Data$Year<=2019]
               
               )

colnames(D1)<-c("AdmArea","Month","Year","TotalAmount")
View(D1)

install.packages("rpivotTable")
library("rpivotTable")

rpivotTable::rpivotTable(D1,rows="AdmArea",cols="Year",vals="TotalAmount",aggregatorName = "Average")
D2<-data.frame(Data$AdmArea[(Data$Year==2021)],
               Data$Month[(Data$Year==2021)],
               Data$Year[(Data$Year==2021)],
               Data$TotalAmount[(Data$Year==2021)])
View(D2)
rpivotTable::rpivotTable(D2,rows="AdmArea",cols="Year",vals="TotalAmount",aggregatorName = "Average")
rpivotTable::rpivotTable(D2,rows="Month",aggregatorName="Sum",vals="TotalAmount")

rpivotTable::rpivotTable(Data, rows="AdmArea",vals="TotalAmount",aggregatorName = "Average")

D3<-data.frame(Data$AdmArea[(Data$AdmArea=="Центральный административный округ")],
               Data$Month[(Data$AdmArea=="Центральный административный округ")],
               Data$Year[(Data$AdmArea=="Центральный административный округ")],
               Data$TotalAmount[(Data$AdmArea=="Центральный административный округ")])
colnames(D3)<-c("AdmArea","Month","Year","TotalAmount")
View(D3)

mean(as.numeric(D3$TotalAmount))

D3$AdmArea[as.numeric(D3$TotalAmount)>mean(as.numeric(D3$TotalAmount))]

