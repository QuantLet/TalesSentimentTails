
R version 3.5.1 (2018-07-02) -- "Feather Spray"
Copyright (C) 2018 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin15.6.0 (64-bit)

R ist freie Software und kommt OHNE JEGLICHE GARANTIE.
Sie sind eingeladen, es unter bestimmten Bedingungen weiter zu verbreiten.
Tippen Sie 'license()' or 'licence()' für Details dazu.

R ist ein Gemeinschaftsprojekt mit vielen Beitragenden.
Tippen Sie 'contributors()' für mehr Information und 'citation()',
um zu erfahren, wie R oder R packages in Publikationen zitiert werden können.

Tippen Sie 'demo()' für einige Demos, 'help()' für on-line Hilfe, oder
'help.start()' für eine HTML Browserschnittstelle zur Hilfe.
Tippen Sie 'q()', um R zu verlassen.

[R.app GUI 1.70 (7543) x86_64-apple-darwin15.6.0]

[Verlauf wiederhergestellt aus /Users/elena/.Rapp.history]

objc[4931]: Class FIFinderSyncExtensionHost is implemented in both /System/Library/PrivateFrameworks/FinderKit.framework/Versions/A/FinderKit (0x7fffa9039c90) and /System/Library/PrivateFrameworks/FileProvider.framework/OverrideBundles/FinderSyncCollaborationFileProviderOverride.bundle/Contents/MacOS/FinderSyncCollaborationFileProviderOverride (0x111e49cd8). One of the two will be used. Which one is undefined.
> data <- read.table(file("Sent100_FF5_SentIndex.csv"), header=FALSE,sep=",")

names=unique(data$V3)
lenam=length(names)

cc=as.matrix(lenam,1)
for (i in 1:lenam) {
  cc[i]=length(which(data$V3 == names[i]))
}

for (i in 1:length(names[which(cc != 1257)])) {
  data=data[-which(data$V3 == names[which(cc != 1257)][i]),]
}

m <- 1257
n <- 96

d=seq(1,120672,by=1257)
d1=d+1256

rets=100*as.numeric(t(data$V4[-d1]))   # returns
retstplus=100*as.numeric(t(data$V4[-d]))   # returns
sm_bull<-data$V8[-d1]
smbullneg<-abs(data$V8[-d1])

m <- 1257-1
n <- 96

i=1   # choose asset
s<- smbullneg[((i-1)*m+1):(i*m)]
s0<-s[which(s!=0)]
#s0<-rank(s)/length(s)
s0<-s

par(pty="s") 
rho=-0.1
plot(s0,exp(-rho*(1/s0 - 1) )  - 1,ylim=c(0,2),xlab="S_t",ylab="beta")
rho=-0.05
points(s0,exp(-rho*(1/s0 - 1) )  - 1,col="red")