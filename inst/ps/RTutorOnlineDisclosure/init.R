
library(dplyr)
select = dplyr::select

reg.summary1 = function(...){
    library(stargazer)
    stargazer(..., 
              title="Results",
              covariate.labels = c("log(miles)", "photos", "photos squared",
                                   "options", "negpct", "log(sellfdback)"),
              column.labels = c("whole dataset","private sellers","dealers"),
              #dep.var.caption = "base model",
              dep.var.labels = "base model",
              model.names = FALSE,
              align=TRUE, 
              type = "text", 
              style = "aer"
              )
}

reg.summary2 = function(...){
  library(stargazer)
  stargazer(..., 
            title="Results",
            covariate.labels = c("log(miles)", "photos", "photos squared",
                                 "options", "negpct", "log(sellfdback)",
                                 "log(bookvalue)", "age*photos", "warranty",
                                 "warranty*photos"),
            column.labels = c("whole dataset","private sellers","dealers", "collectible sample", "bookvalue sample", "interactions with photos"),
            dep.var.labels = c("","",""),
            model.names = FALSE,
            align=TRUE, 
            type = "text", 
            style = "aer"
  )
}

reg.summary3 = function(...){
  library(stargazer)
  stargazer(..., 
            title="Comparing OLS and IV",
            covariate.labels = c("log(miles)", "photos(ols)", "options",
                                 "log(sellfdback)", "negpct", "photos(iv)"),
            column.labels = c("OLS Regression","IV Regression"),
            dep.var.labels = c("",""),
            model.names = FALSE,
            align=TRUE, 
            type = "text", 
            style = "aer"
  )
}

reg.summary4 = function(...){
  library(stargazer)
  stargazer(..., 
            title="Analyzing Text Coefficients",
            omit = c(3,4,5,6),
            covariate.labels = c("log(miles)", "photos", "log(bookvalue)",
                                 "No scratches", "Few scratches", "Scratches", "Many/Big scratches",
                                 "No dents", "Few dents", "Dents", "Many/Big dents",
                                 "No rust", "Few rust", "Rust", "Lot of rust"),
            column.labels = c("Base model","Private seller sample", "Dealer sample", "Book value sample"),
            dep.var.labels = c("","","",""),
            model.names = FALSE,
            align=TRUE, 
            type = "text", 
            style = "aer"
  )
}


tab.summary = function(.dat1, .dat2=NULL, .digits = 2){
  
  library(stargazer)
  
  stargazer(data.frame(.dat1),
            data.frame(.dat2),
            title = "Summary statistics",
            align=TRUE,
            type = "text", 
            style = "aer",  
            digits = .digits,
            digits.extra = 0,
            df = FALSE,
            report = "vct*",
            star.cutoffs = c(0.05, 0.01, 0.001),
            object.names = TRUE,
            model.numbers = FALSE,
            omit.summary.stat = c("n", "max", "min", "sd"),
            omit.stat = c("adj.rsq", "f", "ser") 
  )
}

se.summary = function(.dat1, .dat2){
  
  library(stargazer)
  
  temp <- rbind(.dat1, .dat2)
  temp <- round(temp, digits = 5)
  temp <- rbind(temp, c(abs(temp[1,1]-temp[2,1]), abs(temp[1,2]-temp[2,2]), abs(temp[1,3]-temp[2,3]), abs(temp[1,4]-temp[2,4]), abs(temp[1,5]-temp[2,5]), abs(temp[1,6]-temp[2,6])))
  temp <- cbind(c("Non-clustered", "Clustered", "Absolute difference"),temp)
  colnames(temp) <- c("Standard Error","log(miles)","photos","photos^2/100","options","negpct","log(sellfdback)")
  row.names(temp) <- NULL
  
  stargazer(temp,
            title = "Comparsion of Clustered and Non-clustered Standard Error",
            align=TRUE,
            type = "text", 
            style = "aer",  
            digits = 6,
            digits.extra = 0,
            df = FALSE,
            report = "vct*",
            star.cutoffs = c(0.05, 0.01, 0.001),
            object.names = TRUE,
            model.numbers = FALSE,
            omit.summary.stat = c("n", "max", "min", "sd"),
            omit.stat = c("adj.rsq", "f", "ser") 
  )
}

effectplots = function(.reg1, .reg2){
  
  library(regtools)
  library(gridExtra)
  
  e1 <- effectplot(.reg1, ylab = expression("Effect on log " * biddy[1]), xlab = "Explanatory Variables")
  e2 <- effectplot(.reg2, ylab = expression("Effect on log " * biddy[1]), xlab = "Explanatory Variables")
  
  grid.arrange(e1, e2, ncol=2)
}


