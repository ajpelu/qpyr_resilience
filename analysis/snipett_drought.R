library("RNetCDF")
library("ncdf4")
library("rasterVis")




# Read nc files 
myfiles= list.files(path='/Users/ajpelu/Downloads/tci/', pattern="nc")
myfiles_path <- paste0('/Users/ajpelu/Downloads/tci/', myfiles)

myfiles_path2 <- myfiles_path[c(3:5)]

r <- brick(stack(myfiles_path2))


### nc <- open.nc('/Users/ajpelu/Downloads/TCI_ref_to_month_europe_2000_v1.nc')
print(nc)


nc_data <- read.nc(nc)
mytemp <- var.get.nc(nc)


# Read nc files 

# First, estimate the extent.
# We start with the lat and long, then project it to the Lambert Conformal projection
library(raster)
inputfile <- '/Users/ajpelu/Downloads/tci/TCI_ref_to_month_europe_2001_v1.nc'
inputfile2 <- '/Users/ajpelu/Downloads/tci/TCI_ref_to_month_europe_2002_v1.nc'

# Grab the lat and lon from the data
r <- brick(inputfile2)

bfm <- bfastmonitor(r)



plot(r, 1)

tci <- as.numeric(click(r, n=1))

my_tci <- ts(tci, start = c(2002,1), frequency = 12)
bfm <- bfastmonitor(my_tci, formula = response ~ trend + harmon, start = c(2003,1))

plot(bfm)
levelplot(r)

r2 

projection(r)

newproj <- "+init=epsg:4326"
rr <- projectRaster(r, crs =crs(newproj))

plot(r)




prueba <- evidf %>% 
  dplyr::select(iv_malla_modi_id, lng, lat) %>% 
  unique() %>% 
  head()

prueba_sp <- SpatialPointsDataFrame(prueba[,c("lng", "lat")], prueba)

projection(prueba_sp) <- CRS("+init=epsg:4326")




xxx <- extract(rr, prueba_sp, method='bilinear')



lon <- raster(inputfile, varname="lon")

# Convert to points and match the lat and lons
plat <- rasterToPoints(lat)
plon <- rasterToPoints(lon)
lonlat <- cbind(plon[,3], plat[,3])

# Specify the lonlat as spatial points with projection as long/lat
lonlat <- SpatialPoints(lonlat, proj4string = CRS("+proj=longlat +datum=WGS84"))

# Need the rgdal package to project it to the original coordinate system
library("rgdal")

# My best guess at the proj4 string from the information given
mycrs <- CRS("+proj=lcc +lat_1=35 +lat_2=51 +lat_0=39 +lon_0=14 +k=0.684241 +units=m +datum=WGS84 +no_defs")
plonlat <- spTransform(lonlat, CRSobj = mycrs)
# Take a look
plonlat
extent(plonlat)

# Yay! Now we can properly set the coordinate information for the raster
pr <- raster(inputfile, varname="pr")
# Fix the projection and extent
projection(pr) <- mycrs
extent(pr) <- extent(plonlat)
# Take a look
pr
plot(pr)

# Project to long lat grid
r <- projectRaster(pr, crs=CRS("+proj=longlat +datum=WGS84"))
# Take a look
r
plot(r)
# Add contours
contour(r, add=TRUE)

# Add country lines
library("maps")
map(add=TRUE, col="blue")
I think that looks correct. The c