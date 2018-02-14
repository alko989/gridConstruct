## Construct grid of North Sea and lookup points in the grid.

## Data
df <- data.frame(lon=c(0 ,1 ,5 ,6 ,2 ,2, 5, 1),
                 lat=c(56,60,55,57,54,58,55,60))

## Construct grid
gr <- gridConstruct(df,km=30,scale=1.3,filter=!FALSE)
plot(gr);points(df);map("worldHires",add=TRUE)

## grid factor
gf <- gridFactor(df,gr)
points(gr[gf,],col="red")

## Max distance to nearest grid point
max(dist.km(df,gr[gf,],outer=FALSE))

## 2.
gr <- gridConstruct(df,km=30,scale=1.3,nearestObs=100,connected=FALSE)
plot(gr);points(df);map("worldHires",add=TRUE)


## 3. Create a grid with 0.1 degrees longitude and 0.25 degrees latitude
gr <- gridConstruct(df, "lonlatGrid", lonstep = 0.1, latstep = 0.25)
plot(gr);points(df);map("worldHires",add=TRUE)
gf <- gridFactor(df,gr)
points(gr[gf,],col="red")

## Max distance to nearest grid point
max(dist.km(df,gr[gf,],outer=FALSE))

