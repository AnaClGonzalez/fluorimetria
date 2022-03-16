#script para analisis de datos de fluorimetria
#Lic. Gonzalez Ana Clara; anaclgonzalez92@gmail.com
#Instituto de Investigaciones biológicas Clemente Estable
#Montevideo, Uruguay. 01/12/2021
#
#
#LLamo el primer dato
datos0 <- read.csv("D:/Maestria neurodesarrollo/fotos y resultados ensayos/archivos fluorimetro/pMT sin y con inducis lisadas/i_scgmp.csv", skip = 1)
datos0 <- datos0[,1:2]
datos0 <- cbind(datos0, "t=0")
colnames(datos0)<- c("Longitud de onda (nm)", "Int. Fluo (AU)", "Tiempo")
datos <- read.csv("D:/Maestria neurodesarrollo/fotos y resultados ensayos/archivos fluorimetro/pMT sin y con inducis lisadas/S2_cGMP1mM_5_5_c1min3.csv", skip = 1)
datos <- datos[,1:2]
datos <- cbind(datos, "t=1")
colnames(datos)<- c("Longitud de onda (nm)", "Int. Fluo (AU)", "Tiempo")
#llamo el segundo dato
datos2 <- read.csv("D:/Maestria neurodesarrollo/fotos y resultados ensayos/archivos fluorimetro/pMT sin y con inducis lisadas/medidas/S2_cGMP1mM_5_10_c1min.csv", skip = 1)
datos2 <- datos2[,1:2]
datos2 <- cbind(datos2, "t=2")
colnames(datos2)<- c("Longitud de onda (nm)", "Int. Fluo (AU)", "Tiempo")
datos3 <- read.csv("D:/Maestria neurodesarrollo/fotos y resultados ensayos/archivos fluorimetro/pMT sin y con inducis lisadas/medidas/S2_cGMP1mM_5_10_c1min1ibmx1.csv", skip = 1)
datos3 <- datos3[,1:2]
datos3 <- cbind(datos3, "t=3")
colnames(datos3)<- c("Longitud de onda (nm)", "Int. Fluo (AU)", "Tiempo")
#Hago el data frame con ambos datos
dF <- rbind(datos0,datos)
dF2 <- rbind(datos2, datos3)
dFfinal <- rbind (dF, dF2)
#grafico en un geom_line ambos
#library(ggplot2)#Llamo la librería de ggplot2
line <- ggplot(dFfinal)+
  geom_line(aes( x=`Longitud de onda (nm)`, y=`Int. Fluo (AU)`, color=Tiempo), size = 1.2)+
  theme_light()+
  scale_color_brewer(palette = "Pastel2")+
  theme(axis.title.x=element_text(size=14), axis.title.y=element_text(size=18), axis.text.x = element_text(size=14),axis.text.y = element_text(size=14), legend.title = element_text(size=14), legend.text = element_text(size=14))
#Para ponerle título al grafico
#library(reshape2)#para poder hacer los cambioes en titulo y demas
annotate_figure(line, top = text_grob("", color = "black", face = "bold", size = 14), fig.lab = "Fluorimetría de células S2 lisadas + cGMP", fig.lab.face = "bold", fig.lab.size=14)

