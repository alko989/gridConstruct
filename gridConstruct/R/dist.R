distkm <- function (lon1, lat1, lon2, lat2)
    .Call("distkm", lon1, lat1, lon2, lat2, PACKAGE = "gridConstruct")

nearestkm <- function (lon1, lat1, lon2, lat2)
    .Call("nearestkm", lon1, lat1, lon2, lat2, PACKAGE = "gridConstruct")

## Function to compute distance between positions in km.
## default: outer=TRUE ===> return a distance-matrix
##          outer=FALSE ==> return pointwise distance
dist.km <- function(data1,data2=data1,outer=TRUE){
  d1 <- data1[c("lon","lat")]
  d2 <- data2[c("lon","lat")]
  n1 <- nrow(d1)
  n2 <- nrow(d2)
  if(!outer)return(distkm(d1$lon,d1$lat,d2$lon,d2$lat))
  d1 <- lapply(d1,rep,times=n2)
  d2 <- lapply(d2,rep,each=n1)
  matrix(distkm(d1$lon,d1$lat,d2$lon,d2$lat),n1)
}
