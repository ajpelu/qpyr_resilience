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

We created three datasets:

-   annual and seasonal evi by pixel (output as `./data/evi_atributes_all.csv`)
-   annual and seasonal ndvi by pixel (output as `./data/ndvi_atributes_all.csv`)
-   iv by pixel and by composite (output as `./data/iv_composite.csv`)

The first two dataframes have the following fields:

-   `iv_malla_modi_id`: the identifier of the modis cell
-   `year`
-   `evi` or `ndvi`: the value of the EVI (or NDVI) (cumulative value for each season)
-   `season`: the season of cumulative evi:
-   `0` annual value
-   `1` spring value
-   `2` summer value
-   `3` autumn value
-   `4` winter value
-   `seasonF`: the season coded as factor
-   `long`: longitude coordinates
-   `lat`: latitute coordinates
-   `pop`: numeric code of the *Q. pyrenaica* population

The iv\_composite dataframe has the following fields:

-   `evi` or `ndvi`: value of IV for the date
-   `date`: date of adquisition of the image
-   `composite`: number of composite (23 by year)
-   `iv_malla_modi_id`, `year`, `lat`, `long`, `pop`, `seasonF`

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
|    \* Use a|  \[custom|                                                                                                                     function\](./R/getComposite.R)|

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

### Scale factor of the NDVI and EVI data

``` r
# Apply scale factor https://lpdaac.usgs.gov/dataset_discovery/modis/modis_products_table/mod13q1 
rd <- rd %>% 
  mutate(evi = evi * 0.0001,
         ndvi = ndvi * 0.0001) 
```

### Create dataframe with composites

``` r
iv_composite <- rd %>% 
  dplyr::select(iv_malla_modi_id, evi, ndvi,pop, date, year, long, lat, composite, seasonF = season)
```

### Create seasonal dataframes of EVI and NDVI

-   EVI

``` r
# Create annual evi by pixel 
evi_annual <- rd %>% 
  group_by(iv_malla_modi_id, year) %>%
  summarise(evi = sum(evi[evi >=0])) %>%
  mutate(seasonF='annual', 
         season = 0)

# Create seasonal evi by pixel 
evi_season <- rd %>% 
  group_by(iv_malla_modi_id, year, season) %>%
  summarise(evi = sum(evi[evi >=0])) %>% 
  mutate(seasonF = season) %>% 
  mutate(season = ifelse(season == 'autumn', 3, 
                   ifelse(season == 'winter', 4, 
                    ifelse(season == 'spring', 1,2))))

evidf <- rbind(evi_annual, evi_season)

# Add coordinates and pob 
aux_rd <- rd %>% dplyr::select(iv_malla_modi_id, long, lat, pop) %>%
  group_by(iv_malla_modi_id) %>% unique()


# Join dataframes 
evidf <- evidf %>% dplyr::inner_join(aux_rd, by="iv_malla_modi_id") 
```

-   NDVI

``` r
# Create annual ndvi by pixel 
ndvi_annual <- rd %>% 
  group_by(iv_malla_modi_id, year) %>%
  summarise(ndvi = sum(ndvi[ndvi >=0])) %>%
  mutate(seasonF='annual', 
         season = 0)

# Create seasonal ndvi by pixel 
ndvi_season <- rd %>% 
  group_by(iv_malla_modi_id, year, season) %>%
  summarise(ndvi = sum(ndvi[ndvi >=0])) %>% 
  mutate(seasonF = season) %>% 
  mutate(season = ifelse(season == 'autumn', 3, 
                   ifelse(season == 'winter', 4, 
                    ifelse(season == 'spring', 1,2))))

ndvidf <- rbind(ndvi_annual, ndvi_season)

# Join dataframes 
ndvidf <- ndvidf %>% dplyr::inner_join(aux_rd, by="iv_malla_modi_id")
```

### Export dataframes

``` r
# Export dataframes 
write.csv(evidf, file=paste(di, "/data/evi_atributes_all.csv", sep=""), row.names = FALSE)
write.csv(ndvidf, file=paste(di, "/data/ndvi_atributes_all.csv", sep=""), row.names = FALSE)
write.csv(iv_composite, file=paste(di, "/data/iv_composite.csv", sep=""), row.names = FALSE)
```
