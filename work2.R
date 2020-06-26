# adding additional dates in sequence if some was not in sequence
# just in case these aren't Dates. 
NADayWiseOrders$date <- as.Date(NADayWiseOrders$date)
# all desired dates.
alldates <- data.table(date=seq.Date(min(NADayWiseOrders$date), max(NADayWiseOrders$date), by="day"))
# merge
dt <- merge(NADayWiseOrders, alldates, by="date", all=TRUE)
# now carry forward last observation (alternatively, set NA's to 0)
require(xts)
na.locf(dt)
