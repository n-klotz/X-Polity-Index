##
## Construct the X-POLITY Index
##
## Nicolas Klotz < mail [at] nicolasklotz [dot] de >
## Created: 03-AUG-2014
## Version: p4v2013-xpolity
##
## This script replicates Vreeland's (2008) modification of the polity2 index.
## See: http://faculty.georgetown.edu/jrv24/polityproblem.html
##

# set working directory
setwd("~/Documents/IT/R/Construct XPolity-Scale")

# libraries
library(gdata)  # read.xls()
library(car)    # recode()

# load and open polity IV data
download.file("http://www.systemicpeace.org/inscr/p4v2013.xls", destfile = "p4v2013.xls")
p4 <- read.xls("p4v2013.xls", sheet = "1", na.strings = c(NULL, ""))

# recode (relevant) polity2 components
# for details, refer to 
#   * Marshall/Gurr/Jaggers (2013): Polity IV Project Data Users' Manual, p. 14-17
#   * Vreeland (2008): The Effect of Political Regime on Civil War. Unpacking Anocracy, p. 405
p4$xconst_xpolity <- NA
p4$xconst_xpolity <- recode(p4$xconst, "7=4;6=3;5=2;4=1;3=-1;2=-2;1=-3;-66=-66;-77=-77;-88=-88")

p4$xrcomp_xpolity <- NA
p4$xrcomp_xpolity <- recode(p4$xrcomp, "3=2;2=1;1=-2;0=0;-66=-66;-77=-77;-88=-88")

p4$xropen_xpolity <- 0
p4$xropen_xpolity[p4$xropen==-66] <- -66
p4$xropen_xpolity[p4$xropen==-77] <- -77
p4$xropen_xpolity[p4$xropen==-88] <- -88
p4$xropen_xpolity[(p4$xrcomp_xpolity == 2 | p4$xrcomp_xpolity == 1) & (p4$xropen == 3 | p4$xropen == 4)] <- 1
p4$xropen_xpolity[p4$xrcomp_xpolity == -2 & (p4$xropen == 1 | p4$xropen == 2)] <- -1

p4$xpolity <- NA
p4$xpolity <- p4$xconst_xpolity + p4$xrcomp_xpolity + p4$xropen_xpolity
p4$xpolity[p4$xconst_xpolity == -66 | p4$xrcomp_xpolity == -66 | p4$xropen_xpolity == -66] <- -66
p4$xpolity[p4$xconst_xpolity == -77 | p4$xrcomp_xpolity == -77 | p4$xropen_xpolity == -77] <- -77
p4$xpolity[p4$xconst_xpolity == -88 | p4$xrcomp_xpolity == -88 | p4$xropen_xpolity == -88] <- -88

# save as an RData-Object
save(p4, file="xpolity_1800-2013.RData")

# save as an CSV file
write.csv(p4, file="xpolity_1800-2013.csv", row.names=F, fileEncoding="UTF-8")
