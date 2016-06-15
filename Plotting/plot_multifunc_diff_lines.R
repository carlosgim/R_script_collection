library(ggplot2)

filedata <- paste(getwd(), "fit_parameters.dat", sep = "/")

fit_parameters <- read.table(filedata, header=TRUE, row.names=1)

a <- fit_parameters[,"a"]
b <- fit_parameters[,"power"]

fitfunc <- function(x,a=1,b=1) { a*exp(x*b) }

ggplot(data.frame(x=c(0,134)), aes(x)) +
  stat_function(fun=function(x) fitfunc(x,a[1],b[1]), 
                geom="line", aes(colour="Be - RPA", linetype = "Be - RPA")) +
  stat_function(fun=function(x) fitfunc(x,a[2],b[2]), 
                geom="line", aes(colour="Be - PZOA", linetype = "Be - PZOA"))+
  stat_function(fun=function(x) fitfunc(x,a[3],b[3]), 
                geom="line", aes(colour="Ne - RPA", linetype = "Ne - RPA"))+
  stat_function(fun=function(x) fitfunc(x,a[4],b[4]), 
                geom="line", aes(colour="Ne - PZOA", linetype = "Ne - PZOA"))+
  stat_function(fun=function(x) fitfunc(x,a[5],b[5]), 
                geom="line", aes(colour="He - RPA", linetype = "He - RPA"))+
  stat_function(fun=function(x) fitfunc(x,a[6],b[6]), 
                geom="line", aes(colour="He - PZOA", linetype = "Ne - PZOA"))+
  stat_function(fun=function(x) fitfunc(x,a[7],b[7]), 
                geom="line", aes(colour="H", linetype ="H"))+
  scale_y_log10()+
  xlab("Atomic Number")+
  ylab(expression(paste(Delta, sigma[QED]," log-scale")))+
  scale_x_continuous(breaks = seq(0, 130, length.out = 6))+
  scale_colour_manual(values = c("Be - RPA"="red", "Be - PZOA"= "red", 
                               "Ne - RPA"="green", 
                               "Ne - PZOA"="green",
                               "He - RPA" = "blue", 
                               "He - PZOA" = "blue",
                               "H" = "black"))+
  scale_linetype_manual(values = c("Be - RPA" = 2, "Be - PZOA"= 1, 
                               "Ne - RPA"= 2, 
                               "Ne - PZOA"= 1,
                               "He - RPA" = 2, 
                               "He - PZOA" = 1,
                               "H" = 1))
ggsave("QED_logscalefit.png", height=12, width=18, dpi=200, units = "cm")
  