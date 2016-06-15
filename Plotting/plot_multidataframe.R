library(ggplot2)

# ------------------------------------------------------------------------------
# Este script permite crear graficos utilizando distintos data.frames
# ------------------------------------------------------------------------------
# Rayleigh
filework <-paste(getwd(), "graxsmac.tab", sep = "/")
# Comptom, Fotoelectrico y creacion de pares
filework2 <-paste(getwd(), "gxs.tab", sep = "/")

rayleigh <- read.table(filework, header=FALSE, sep ="", quote="#", skip = 5)
par_ph_compt <- read.table(filework2, header=FALSE, 
                           sep ="", quote="#", skip = 5)

# Nota: Debo tener cuidado por que las dimensiones de los data.frames no 
# coinciden, por lo tanto tengo problemas para agregar el label de las 
# curvas

ggplot()+
  scale_x_log10()+ scale_y_log10()+
  geom_line(aes(x = rayleigh[,1], y = rayleigh[,2], color = "Rayleigh"))+
  geom_line(aes(x = par_ph_compt[,1], y = par_ph_compt[,3], color = "Compton"))+
  geom_line(aes(x = par_ph_compt[,1], y = par_ph_compt[,4], color ="Photoabsortion"))+
  geom_line(aes(x = par_ph_compt[,1], y = par_ph_compt[,5], color = "Pair production"))+
  geom_line(aes(x = par_ph_compt[,1], y = par_ph_compt[,6], color = "Total"))+
  xlab("Energy [eV]")+
  ylab(expression(paste(mu/rho,"[",cm^2/g,"]")))+
  #theme(legend.position=c(0.1,0.1))
  scale_colour_manual(values = c("Rayleigh"="red", "Compton"= "green", 
                                 "Photoabsortion"="blue", 
                                 "Pair production"="black",
                                 "Total" = "brown"))+
  scale_fill_discrete(guide = guide_legend(title = NULL))
ggsave("attenuation.png", height=6, width=8, dpi=300)


print(head(par_ph_compt))
