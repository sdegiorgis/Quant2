insheet using https://raw.githubusercontent.com/sdegiorgis/Quant2/master/Quant2FinalPaper2.csv, clear
reg v5 smocforhousingunitswithandwithou estimateincomeandbenefitsin2017i
estimates store model1
reg v6 v15 estimateincomeandbenefitsin2017i
estimates store model2
esttab model*, order(_cons) b(a3) t(a3) sfmt(a3) nobase label mtitles varwidth(40) stats(N r2 F)
