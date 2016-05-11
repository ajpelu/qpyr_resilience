Explore resilience patterns of the different *Q. pyrenaica* patches
===================================================================

``` r
library("rgdal")
library("sp")
library("raster")
library("rasterVis")
source(paste0(di,"/R/exportpdf.R")) # function to export raster levelplots maps as pdf
library("dplyr")
library("ggplot2")
library("reshape2")
```

Read and prepare data
---------------------

``` r
# Read data
eviresi <- read.csv(file=paste(di, "/data/evi_resilience.csv", sep=""), header = TRUE, sep = ',')
```

Maps
====

-   Create raster maps (two projections: `epsg:4326` and `epsg:23030`)
-   Export raster maps and stacks (see `/data/raster/`)

``` r
# Create a spatial dataframe 
eviresi_sp <- SpatialPointsDataFrame(coords = eviresi[,c('lng','lat')], data = eviresi,
                               proj4string = CRS("+init=epsg:4326"))

# Transform 
eviresi_sp <- spTransform(eviresi_sp, CRS("+init=epsg:23030"))

# Loop to create raster map 
resilience_indicators <- c('rs','rt', 'rc', 'rrs')

for (i in resilience_indicators) { 

  aux_spatial <- eviresi_sp 
  
  # raster auxiliar 
  aux_rast <- raster(aux_spatial, resolution=250)

  # variable z
  zvar <- i

  # raster_layer 
  r_resi <- rasterize(aux_spatial, aux_rast, i, fun=mean)
  names(r_resi) <- i 
  
  # reprojected raster
  r_resi_re <- projectRaster(r_resi, crs=crs("+init=epsg:4326"))
  names(r_resi_re) <- i 
  
  # assign 
  name_raster <- paste("r_",i, sep="")
  name_raster_re <- paste("r_",i,"_re", sep="")
  
  assign(name_raster, r_resi)
  assign(name_raster_re, r_resi_re)
  
  
  writeRaster(r_resi, file=paste(di, "/data/raster/r_", i, ".asc", sep=""), overwrite=TRUE)
  writeRaster(r_resi_re, file=paste(di, "/data/raster/r_", i, "_re", ".tif", sep=""), overwrite=TRUE)
  
  }


# Create stack of raster 
stack_resi <- stack(r_rc, r_rs, r_rt, r_rrs) 
stack_resi_re <- stack(r_rc_re, r_rs_re, r_rt_re, r_rrs_re)

# Export stack 
temp <- getwd()
setwd(paste(di, "/data/raster/", sep=""))
writeRaster(stack_resi, filename = 'r_resi_stack', overwrite =TRUE) 
writeRaster(stack_resi_re, filename = 'r_resi_re_stack', overwrite =TRUE) 
setwd(temp)
```

Spatial explorarion of the resilience components
------------------------------------------------

### Resilience

``` r
# Resilience 

# Select a palette http://colorbrewer2.org/
mypal <- brewer.pal(9, "RdYlGn")
# Specify the color palette
myTheme=rasterTheme(region=mypal)

lp <- levelplot(stack_resi_re, 
          margin=FALSE,
          layer='rs', 
          par.settings=myTheme,
          pretty=TRUE,
          main='Resilience (rs)', xlab=NULL, ylab=NULL)

print(lp)
```

<img src="explore_resilience_files/figure-markdown_github/unnamed-chunk-3-1.png" alt="Resilience"  />
<p class="caption">
Resilience
</p>

``` r
exportpdf(mypdf=paste0(di, '/man/images/raster_rs.pdf'), lp) 
```

    ## quartz_off_screen 
    ##                 2

### Resistance

``` r
# Resistance  

# Select a palette http://colorbrewer2.org/
mypal <- brewer.pal(9, "RdYlGn")
# Specify the color palette
myTheme=rasterTheme(region=mypal)

lp <- levelplot(stack_resi_re, 
          margin=FALSE,
          layer='rt', 
          par.settings=myTheme,
          pretty=TRUE,
          main='Resistance (rt)', xlab=NULL, ylab=NULL)

print(lp)
```

<img src="explore_resilience_files/figure-markdown_github/unnamed-chunk-4-1.png" alt="Resistance"  />
<p class="caption">
Resistance
</p>

``` r
exportpdf(mypdf=paste0(di, '/man/images/raster_rt.pdf'), lp) 
```

    ## quartz_off_screen 
    ##                 2

### Recovery

``` r
# Recovery 

# Select a palette http://colorbrewer2.org/
mypal <- brewer.pal(9, "RdYlGn")
# Specify the color palette
myTheme=rasterTheme(region=mypal)

lp <- levelplot(stack_resi_re, 
          margin=FALSE,
          layer='rc', 
          par.settings=myTheme, 
          pretty=TRUE,
          main='Recovery (rc)', xlab=NULL, ylab=NULL)

print(lp)
```

<img src="explore_resilience_files/figure-markdown_github/unnamed-chunk-5-1.png" alt="Recovery"  />
<p class="caption">
Recovery
</p>

``` r
exportpdf(mypdf=paste0(di, '/man/images/raster_rc.pdf'), lp) 
```

    ## quartz_off_screen 
    ##                 2

### Relative Resilience

``` r
# Relative Resilience 

# Select a palette http://colorbrewer2.org/
mypal <- brewer.pal(9, "RdYlGn")
# Specify the color palette
myTheme=rasterTheme(region=mypal)

lp <- levelplot(stack_resi_re, 
          margin=FALSE,
          layer='rrs', 
          par.settings=myTheme,
          pretty=TRUE,
          main='Relative Resilience (rs)', xlab=NULL, ylab=NULL)

print(lp)
```

<img src="explore_resilience_files/figure-markdown_github/unnamed-chunk-6-1.png" alt="Relative Resilience"  />
<p class="caption">
Relative Resilience
</p>

``` r
exportpdf(mypdf=paste0(di, '/man/images/raster_rrs.pdf'), lp) 
```

    ## quartz_off_screen 
    ##                 2

Elevation pattern
=================

-   We remove population `Cadiar`

``` r
# Prepare data
elev <- read.csv(file=paste(di, "/data/elev.csv", sep=""), header = TRUE, sep = ',')

eviresi <- eviresi %>% 
  # join elevation data
  dplyr::inner_join(elev, by='iv_malla_modi_id') %>% 
  # Add a variable for population cluster
  mutate(clu_pop = ifelse(poblacion == 1, 'a', 
                          ifelse(poblacion %in% c(2,3,4,5), 'b', 
                                 ifelse(poblacion %in% c(6,7,8), 'c', 'out'))))

# Filter out cluster 
eviresi_f <- eviresi %>% filter(clu_pop != 'out')
```

Explore elevation pattern general and by cluster of populations
---------------------------------------------------------------

``` r
# Change format of the dataset (wide to long)
df_melt <- melt(eviresi_f, id.vars = c('iv_malla_modi_id', 'poblacion',
                                      'lng', 'lat', 'elev', 'clu_pop'))

df_aux <- df_melt %>% filter(variable %in% c('rs','rt','rc', 'rrs'))

  
label_variable <- c('rt' = 'Resistance', 
                    'rc' = 'Recovery',
                    'rs' = 'Resilience',
                    'rrs' = 'Relative Resilience')
label_cluster <- c('a' = 'Camarate',
                   'b' = 'Northern slope',
                   'c' = 'Southern slope')
```

### General pattern

``` r
g <- ggplot(df_aux[df_aux$variable != 'rrs',], aes(x=elev, y=value)) + 
  geom_point(col='gray') + 
  geom_smooth(method = 'lm') + 
  facet_wrap(~variable, nrow=1, labeller = as_labeller(label_variable)) + 
  theme_bw() + 
  theme(strip.background = element_rect(fill = "white")) 

pdf(file=paste0(di, "/man/images/plot_resicomp_elev.pdf"), height = 5, width = 8)
g
dev.off() 
```

    ## quartz_off_screen 
    ##                 2

``` r
gr <- ggplot(df_aux[df_aux$variable == 'rrs',], aes(x=elev, y=value)) + 
  geom_point(col='gray') + 
  theme_bw() +
  geom_smooth(method = 'lm') + 
  ggtitle('Relative Resilience')

gr
```

<img src="explore_resilience_files/figure-markdown_github/unnamed-chunk-10-1.png" alt="Relative Resilience vs. elevation"  />
<p class="caption">
Relative Resilience vs. elevation
</p>

``` r
pdf(file=paste0(di, "/man/images/plot_resi_rel_elev.pdf"), height = 5, width = 5)
gr
dev.off() 
```

    ## quartz_off_screen 
    ##                 2

### Elevational pattern by population

``` r
gp <- ggplot(df_aux[df_aux$variable != 'rrs',], aes(x=elev, y=value)) +
  geom_point(col='gray') + 
  geom_smooth(method = 'lm') + 
  facet_grid(variable ~clu_pop, scales = 'free_y',
             labeller = labeller(.rows = label_variable,
                                 .cols = label_cluster)) +
  # facet_wrap(~variable, labeller = as_labeller(label_variable)) + 
  theme_bw() + 
  theme(strip.background = element_rect(fill = "white")) 
gp 
```

<img src="explore_resilience_files/figure-markdown_github/unnamed-chunk-11-1.png" alt="Resilience components vs. elevation (grouped by cluster) "  />
<p class="caption">
Resilience components vs. elevation (grouped by cluster)
</p>

``` r
pdf(file=paste0(di, "/man/images/plot_resicomp_elev_grouped.pdf"), height = 8, width = 8)
gp
dev.off() 
```

    ## quartz_off_screen 
    ##                 2

``` r
gpr <- ggplot(df_aux[df_aux$variable == 'rrs',], aes(x=elev, y=value)) +
  geom_point(col='gray') + 
  geom_smooth(method = 'lm') + 
  facet_wrap(~clu_pop, labeller = as_labeller(label_cluster)) +
  theme_bw() + 
  theme(strip.background = element_rect(fill = "white")) 
gpr 
```

<img src="explore_resilience_files/figure-markdown_github/unnamed-chunk-12-1.png" alt="Relative resilience vs. elevation (grouped by cluster) "  />
<p class="caption">
Relative resilience vs. elevation (grouped by cluster)
</p>

``` r
pdf(file=paste0(di, "/man/images/plot_resi_rel_elev_grouped.pdf"), height = 6, width = 12)
gpr
dev.off()
```

    ## quartz_off_screen 
    ##                 2

Explore pattern by population (cluster)
=======================================

``` r
gpop <- ggplot(df_aux, aes(x=clu_pop, y=value)) + 
  geom_boxplot() + 
  facet_wrap(~variable, scales = 'free_y', labeller = as_labeller(label_variable)) + 
  theme_bw() + xlab('')+
  theme(strip.background = element_rect(fill = "white")) +  
  scale_x_discrete(labels = label_cluster)

pdf(file=paste0(di, "/man/images/plot_resicomp_by_cluster.pdf"), height = 7, width = 8)
gpop
dev.off()
```

    ## quartz_off_screen 
    ##                 2