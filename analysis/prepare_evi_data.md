``` r
library("dplyr")
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library("lubridate")
```

    ## 
    ## Attaching package: 'lubridate'

    ## The following object is masked from 'package:base':
    ## 
    ##     date

``` r
library("ggplot2")
library("knitr")
library('printr')
source(paste0(di,"/R/getComposite.R"))
```

Read and prepare evi data
-------------------------

We created two datasets:

-   annual evi by pixel
-   seasonal evi by pixel

Each dataframe has the following fields:

-   `iv_malla_modi_id`: the identifier of the modis cell
-   `year`
-   `evi_mean`: the value of the evi (cumulative value for each season)
-   `season`: the season of cumulative evi:
-   `0` annual value
-   `1` spring value
-   `2` summer value
-   `3` autumn value
-   `4` winter value
-   `seasonF`: the season coded as factor
-   `lng`: longitude coordinates
-   `lat`: latitute coordinates
-   `poblacion`: numeric code of the *Q. pyrenaica* population

``` r
# Read data
# rawdata <- read.csv(file=paste(di, "/data_raw/evi/iv_quercus_pyrenaica.csv", sep= ""), header = TRUE, sep = ',')
rawdata <- read.csv(file=paste(di, "/data_raw/evi/iv_raw_2016.csv", sep= ""), header = TRUE, sep = ',')
```

Some metadata of the time series
--------------------------------

###  Temporal range of the Time series

``` r
# Get temporal range of the data
# Start date
unique(min(as.Date(rawdata$date)))
```

    ## [1] "2000-02-18"

``` r
# End date 
unique(max(as.Date(rawdata$date)))
```

    ## [1] "2016-12-18"

### QA

``` r
# See n of images per year and per pixel 
n_images_pixel <- rawdata %>% 
  mutate(year = lubridate::year(date)) %>% 
  group_by(year) %>%
  summarise(n = n(),
            n_pixel = n()/length(unique(iv_malla_modi_id)))

kable(n_images_pixel)
```

|        year|         n|                                                                                                                                           n\_pixel|
|-----------:|---------:|--------------------------------------------------------------------------------------------------------------------------------------------------:|
|        2000|     36280|                                                                                                                                                 20|
|        2001|     41722|                                                                                                                                                 23|
|        2002|     41722|                                                                                                                                                 23|
|        2003|     41722|                                                                                                                                                 23|
|        2004|     41722|                                                                                                                                                 23|
|        2005|     41722|                                                                                                                                                 23|
|        2006|     41722|                                                                                                                                                 23|
|        2007|     41722|                                                                                                                                                 23|
|        2008|     41722|                                                                                                                                                 23|
|        2009|     41722|                                                                                                                                                 23|
|        2010|     41722|                                                                                                                                                 23|
|        2011|     41722|                                                                                                                                                 23|
|        2012|     41722|                                                                                                                                                 23|
|        2013|     41722|                                                                                                                                                 23|
|        2014|     41722|                                                                                                                                                 23|
|        2015|     41722|                                                                                                                                                 23|
|        2016|     41722|                                                                                                                                                 23|
|   \#\# Prep|  are data|                                                                                                                                                   |
|  \#\#\# Get|   the com|                                                                                                                posite of the images and the season|
|   \* See \[|  Testa et|  al. 2014\](<https://www.researchgate.net/publication/262566793_Correcting_MODIS_16-day_composite_NDVI_time-series_with_actual_acquisition_dates>)|
|    \* Using|  a \[cust|                                                                                                                  om function\](./R/getComposite.R)|

``` r
# Get leap years 
years <- unique(rawdata$year)
ly <- years[leap_year(years)]

# Two functions 
rd <- rawdata %>% 
  mutate(m= lubridate::month(date),
         d= lubridate::day(date)) %>% 
  mutate(composite = ifelse(year %in% ly, 
                            getComposite_leap(m,d),
                            getComposite_nonleap(m,d))) %>% 
  mutate(season = ifelse(composite < 6, 'winter',
                   ifelse(composite < 12, 'spring',
                    ifelse(composite < 18, 'summer','autumn'))))
```

Scale factor of the NDVI and EVI data
-------------------------------------

``` r
# Apply scale factor https://lpdaac.usgs.gov/dataset_discovery/modis/modis_products_table/mod13q1 
rd <- rd %>% 
  mutate(evi = evi * 0.0001,
         ndvi = ndvi * 0.0001) 
```

``` r
# Create annual evi by pixel 
eviyear <- rawdata %>% 
  group_by(iv_malla_modi_id, year) %>%
  summarise(evi = sum(myevi[myevi >=0])) %>%
  mutate(season=0)


# Create seasonal evi 

# Julian date 
# >81 <=173 --> spring (1)
# >173 <=265 --> summer (2)
# > 265 <=356 --> autum (3)
# > 356 and < 81 --> winter (4)
# Get julian day of limits of the season
sp <-lubridate::yday(as.Date("2000-03-21"))
su <- lubridate::yday(as.Date("2000-06-21"))
au <-  lubridate::yday(as.Date("2000-09-21"))
wi <- lubridate::yday(as.Date("2000-12-21"))
season_julian <- c(sp,su,au,wi)

eviseason <- rawdata %>%
  mutate(jday=lubridate::yday(date)) %>%
  select(iv_malla_modi_id, year, myevi, jday) %>% 
  mutate(season = ifelse(jday > 81 & jday <= 173, 1,
                        ifelse(jday > 173 & jday <= 265, 2, 
                               ifelse(jday > 265 & jday <= 356, 3, 4)))) %>%
  group_by(iv_malla_modi_id, year, season) %>%
  summarise(evi = sum(myevi[myevi >=0]))


evidf <- rbind(eviyear, eviseason)

evidf <- evidf %>% 
  mutate(seasonF = ifelse (season == 0, 'annual',
                           ifelse(season == 1, 'spring',
                                  ifelse(season == 2, 'summer',
                                         ifelse(season == 3, 'autumn', 'winter')))))



# Add coordinates and pob 
evi_aux <- rawdata %>% select(iv_malla_modi_id, lng, lat, poblacion) %>%
  group_by(iv_malla_modi_id) %>% unique()


# Join dataframes 
evi <- evidf %>% inner_join(evi_aux, by="iv_malla_modi_id") 

# Export evi dataframe
write.csv(evi, file=paste(di, "/data/evi_attributes_all.csv", sep=""), row.names = FALSE)
```
