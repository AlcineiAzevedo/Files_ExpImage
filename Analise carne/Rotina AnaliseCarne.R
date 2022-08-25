remove(list=ls())
library(ExpImage)
setwd_script()

im=read_image("A198.JPG",plot=TRUE)
info_image(im)
im=resize_image(im,percentage = 20,plot=TRUE)
info_image(im)

resolucao=pick_resolution(im,centimeters = 6)
resolucao

seg=pick_segmentation(im)
medidas1=measure_image(seg)

medidas1$measures[3:4]
medidas1$measures[3:4]/resolucao$dpc

im2=extract_pixels(im,target=seg,plot=TRUE,valueSelect = c(0,0,0))
plot_indexes(im2)

index=gray_scale(im2,method="g",plot=TRUE)
plot_image(index,col=3)



seg2=segmentation(index,treshold = 0.7,plot=TRUE)

sum(seg2)
sum(seg2)/resolucao$dpc


100*sum(seg2)/sum(seg)


mask_pixels(im, TargetPixels = seg2,plot=TRUE,col="blue")


