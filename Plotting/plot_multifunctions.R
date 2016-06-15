library(ggplot2)

filedata <- paste(getwd(), "fit_parameters.dat", sep = "/")

fit_parameters <- read.table(filedata, header=TRUE, row.names=1)

a <- fit_parameters[,"a"]
b <- fit_parameters[,"power"]

fitfunc <- function(x,a=1,b=1) { a*exp(x*b) }

ggplot(data.frame(x=c(0,84)), aes(x)) +
  stat_function(fun=function(x) fitfunc(x,a[1],b[1]), 
                geom="line", aes(colour="Be - RPA"))+
  stat_function(fun=function(x) fitfunc(x,a[2],b[2]), 
                geom="line", aes(colour="Be - PZOA"))+
  stat_function(fun=function(x) fitfunc(x,a[3],b[3]), 
                geom="line", aes(colour="Ne - RPA"))+
  stat_function(fun=function(x) fitfunc(x,a[4],b[4]), 
                geom="line", aes(colour="Ne - PZOA"))+
  stat_function(fun=function(x) fitfunc(x,a[5],b[5]), 
                geom="line", aes(colour="He - RPA"))+
  stat_function(fun=function(x) fitfunc(x,a[6],b[6]), 
                geom="line", aes(colour="He - PZOA"))+
  stat_function(fun=function(x) fitfunc(x,a[7],b[7]), 
                geom="line", aes(colour="H"))+
  scale_y_log10()+
  xlab("Atomic Number")+
  ylab(expression(paste(Delta, sigma[QED]," log-scale")))

ggsave("QED_logscalefit.png", height=8, width=12, dpi=300, units = "cm")
  