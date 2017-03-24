This package constitutes an interactive R problem set based on the RTutor package (https://github.com/skranz/RTutor).

This problem set analyses information asymmetries between a seller and a possible bidder in used good auctions. It sheds some light upon how to prevent this by disclosing as much information as possible online. The entire problem set is developed from the paper **"Asymmetric Information, Adverse Selection and Online Disclosure:
The Case of eBay Motors"**, written by Gregory Lewis, published in 2011 in the American Economic Review 101(4). You may download the paper from <a href="https://www.aeaweb.org/articles?id=10.1257/aer.101.4.1535" target = "_blank"> aeaweb.org/articles?id=10.1257/aer.101.4.1535</a> to get more detailed information. On the same webpage, the whole dataset utilized for the initial analysis in the paper, as well as the Stata Code are provided aswell. This problem set uses a condensed version of the original data, which may be downloaded here: <a href="https://github.com/rotterp/RTutorOnlineDisclosure" target = "_blank"> github.com/rotterp/RTutorOnlineDisclosure </a>


## 1. Installation

RTutor and this package is hosted on Github. To install everything, run the following code in your R console.
```s
if (!require(devtools))
  install.packages("devtools")
source_gist("gist.github.com/skranz/fad6062e5462c9d0efe4")
install.rtutor(update.github=TRUE)

devtools::install_github("rotterp/RTutorOnlineDisclosure", upgrade_dependencies=FALSE)
```

## 2. Show and work on the problem set
To start the problem set first create a working directory in which files like the data sets and your solution will be stored. Then adapt and run the following code.
```s
library(RTutorOnlineDisclosure)

# Adapt your working directory to an existing folder
setwd("C:/problemsets/RTutorOnlineDisclosure")
# Adapt your user name
run.ps(user.name="Jon Doe", package="RTutorOnlineDisclosure",
       load.sav=TRUE, sample.solution=FALSE)
```
If everything works fine, a browser window should open, in which you can start exploring the problem set.
