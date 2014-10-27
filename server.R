library(shiny)
shinyServer(
        function(input,output){
                output$ranPlot<-renderPlot({
                        t1<-tempfile(fileext=".zip")
                        download.file("http://data.octo.dc.gov/feeds/crime_incidents/archive/crime_incidents_2011_CSV.zip",method="curl",t1)#method="curl",destfile = "t1")
                        d11<-read.csv(unzip(t1))
                        unlink(t1)
                        
                        t2<-tempfile(fileext=".zip")
                        download.file("http://data.octo.dc.gov/feeds/crime_incidents/archive/crime_incidents_2012_CSV.zip",method="curl",t2)#method="curl",destfile = "t2")
                        d12<-read.csv(unzip(t2))
                        unlink(t2)
                        
                        t3<-tempfile(fileext=".zip")
                        download.file("http://data.octo.dc.gov/feeds/crime_incidents/archive/crime_incidents_2013_CSV.zip",method="curl",t3)#method="curl",destfile = "t3")
                        d13<-read.csv(unzip(t3))
                        unlink(t3)
                        
                        off_11<-split(d11,d11$OFFENSE)
                        off_12<-split(d12,d11$OFFENSE)
                        off_13<-split(d13,d11$OFFENSE)
                        
                        num_off_11<-lapply(off_11,function(y) table(y$DISTRICT))
                        num_off_12<-lapply(off_12,function(y) table(y$DISTRICT))
                        num_off_13<-lapply(off_13,function(y) table(y$DISTRICT))
                        
                        t<-cbind(num_off_11[[as.character(eval(input$select))]] , num_off_12[[as.character(eval(input$select))]] , num_off_13[[as.character(eval(input$select))]])
                        tt<-data.frame(t)
                        #names(tt)<-c("2011","2012","2013")
                        barplot(t(tt),ylab="Frequency",col=c("darkblue","red","green"),
                                legend = c("2011","2012","2013"), beside=TRUE,las=2,cex.names=1)

                })
        }
)