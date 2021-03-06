# exp growth tests_by_distance
library(drc)
par(mfrow=c(1,4))
growth25 <- read.delim("report25", header = TRUE, sep = " ")
model <- drm(tests ~ distance, fct = EXD.2(), data = growth25)
plot(model, log="", type="all")
growth50 <- read.delim("report50", header = TRUE, sep = " ")
model <- drm(tests ~ distance, fct = EXD.2(), data = growth50)
plot(model, log="", type="all")
growth75 <- read.delim("report75", header = TRUE, sep = " ")
model <- drm(tests ~ distance, fct = EXD.2(), data = growth75)
plot(model, log="", type="all")
growth100 <- read.delim("report100", header = TRUE, sep = " ")
model <- drm(tests ~ distance, fct = EXD.2(), data = growth100)
plot(model, log="", type="all")
