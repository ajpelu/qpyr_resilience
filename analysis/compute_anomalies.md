``` r
library("dplyr")
library("lubridate")
library("ggplot2")
library("RCurl")
library("tidyr")
```

Read data
=========

Two dataframes: \* EVI seasonal \* IV composites

``` r
# Read data
iv <- read.csv(file=paste(di, "/data/iv_composite.csv", sep=""), header = TRUE, sep = ',')
evi <- read.csv(file=paste(di, "/data/evi_atributes_all.csv", sep=""), header = TRUE, sep = ',')
```

Compute anomalies
=================

By composite
------------

``` r
# Set counters
pixels <- unique(iv$iv_malla_modi_id)
composites <- unique(iv$composite)
years <- unique(iv$year)

# Set dataframe to compute anomaly
df <- iv 

# Create emtpy datafraje to store output 
anomalos <- data.frame()

for (i in pixels){
  df_aux <- df[df$iv_malla_modi_id == i,]
  
  # Create empty auxiliar dataframe to store results
  aux_composite <- data.frame() 
  
  for (j in composites) {
    # Create df_auxiliar by composite
    df_by_composite <- df_aux[df_aux$composite == j,]
    
    # Create empty df to store anomlay of composite j of all year 
    aux_anomaly <- data.frame() 
    
    for (y in years){
      # get mean evi for the reference period
      iv_ref <- df_by_composite %>% 
        filter(year != y) %>% 
        summarise(mean(evi))
      
      # get evi for the year
      iv_year <- df_by_composite[df_by_composite$year == y, 'evi']
      # To solve the problems with the year without composites (i.e 2000)
      iv_year <- ifelse(length(iv_year) == 0, 0, iv_year)
      
      # Compute standardized anomaly
      anomaly_std <- ((iv_year - iv_ref) / (iv_year + iv_ref))*100
      names(anomaly_std) <- 'anomaly_std'
      
      # Compute anomaly
      anomaly <- (iv_year - iv_ref)
      names(anomaly) <- 'anomaly'
      
      # Create dataframe 
      aux <- cbind(y, anomaly, anomaly_std)
      aux_anomaly <- rbind(aux_anomaly, aux)
      } 
      
    aux_compos <- aux_anomaly %>% mutate(composite = j)
    
    aux_composite <- rbind(aux_composite, aux_compos)
    
  }
    
  # Remove the composites 1,2 an 3 for year 2000 
  aux_composite <- aux_composite[!(aux_composite$y == 2000 & aux_composite$composite %in% c(1:3)), ] 
    
  # Add name of the pixel 
  aux_composite <- aux_composite %>% mutate(iv_malla_modi_id = i)
  
  # Output 
  anomalos <- rbind(anomalos, aux_composite)
}   


# Add pob, lat, long, etc 
iv_aux <- iv %>% dplyr::select(iv_malla_modi_id, long, lat, pop) %>%
  group_by(iv_malla_modi_id) %>% unique()

# Join dataframes 
anomalias_composite <- anomalos %>% dplyr::inner_join(iv_aux, by="iv_malla_modi_id") 

write.csv(anomalias_composite, file=paste(di, "/data/anomalies/anomalias_composite.csv", sep=""), row.names = FALSE)
```

By season
=========

``` r
# Set counters
pixels <- unique(evi$iv_malla_modi_id)
composites <- unique(evi$seasonF)
years <- unique(evi$year)

# Set dataframe to compute anomaly
df <- evi

# Create emtpy datafraje to store output 
anomalos <- data.frame()

for (i in pixels){
  df_aux <- df[df$iv_malla_modi_id == i,]
  
  # Create empty auxiliar dataframe to store results
  aux_composite <- data.frame() 
  
  for (j in composites) {
    # Create df_auxiliar by composite
    df_by_composite <- df_aux[df_aux$seasonF == j,]
    
    # Create empty df to store anomlay of composite j of all year 
    aux_anomaly <- data.frame() 
    
    for (y in years){
      # get mean evi for the reference period
      iv_ref <- df_by_composite %>% 
        filter(year != y) %>% 
        summarise(mean(evi))
      
      # get evi for the year
      iv_year <- df_by_composite[df_by_composite$year == y, 'evi']
      # To solve the problems with the year without composites (i.e 2000)
      iv_year <- ifelse(length(iv_year) == 0, 0, iv_year)
      
      # Compute standardized anomaly
      anomaly_std <- ((iv_year - iv_ref) / (iv_year + iv_ref))*100
      names(anomaly_std) <- 'anomaly_std'
      
      # Compute anomaly
      anomaly <- (iv_year - iv_ref)
      names(anomaly) <- 'anomaly'
      
      # Create dataframe 
      aux <- cbind(y, anomaly, anomaly_std)
      aux_anomaly <- rbind(aux_anomaly, aux)
      } 
      
    aux_compos <- aux_anomaly %>% mutate(composite = j)
    
    aux_composite <- rbind(aux_composite, aux_compos)
    
  }
    
  # Add name of the pixel 
  aux_composite <- aux_composite %>% mutate(iv_malla_modi_id = i)
  
  # Output 
  anomalos <- rbind(anomalos, aux_composite)
}   



# Add pob, lat, long, etc 
evi_aux <- evi %>% dplyr::select(iv_malla_modi_id, long, lat, pop) %>%
  group_by(iv_malla_modi_id) %>% unique()

# Join dataframes 
anomalias_season <- anomalos %>% dplyr::inner_join(evi_aux, by="iv_malla_modi_id") 

write.csv(anomalias_season, file=paste(di, "/data/anomalies/anomalias_season.csv", sep=""), row.names = FALSE)
```
