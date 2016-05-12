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
library("purrr")
library("pander")
library("knitr")
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

Spatial exploration of the resilience components
------------------------------------------------

### Resilience

<img src="explore_resilience_files/figure-markdown_github/unnamed-chunk-3-1.png" alt="Resilience"  />
<p class="caption">
Resilience
</p>

    ## quartz_off_screen 
    ##                 2

### Resistance

<img src="explore_resilience_files/figure-markdown_github/unnamed-chunk-4-1.png" alt="Resistance"  />
<p class="caption">
Resistance
</p>

    ## quartz_off_screen 
    ##                 2

### Recovery

<img src="explore_resilience_files/figure-markdown_github/unnamed-chunk-5-1.png" alt="Recovery"  />
<p class="caption">
Recovery
</p>

    ## quartz_off_screen 
    ##                 2

### Relative Resilience

<img src="explore_resilience_files/figure-markdown_github/unnamed-chunk-6-1.png" alt="Relative Resilience"  />
<p class="caption">
Relative Resilience
</p>

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

g
```

<img src="explore_resilience_files/figure-markdown_github/unnamed-chunk-9-1.png" alt="Resilience components vs. elevation"  />
<p class="caption">
Resilience components vs. elevation
</p>

``` r
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

gpop
```

<img src="explore_resilience_files/figure-markdown_github/unnamed-chunk-13-1.png" alt="Resilience components by cluster (populations)"  />
<p class="caption">
Resilience components by cluster (populations)
</p>

``` r
pdf(file=paste0(di, "/man/images/plot_resicomp_by_cluster.pdf"), height = 7, width = 8)
gpop
dev.off()
```

    ## quartz_off_screen 
    ##                 2

Exploring relationships
=======================

``` r
kable(reg_coef, caption = "Coefficients of Regression")
```

| clu\_pop | term        |    estimate|  std.error|   statistic|    p.value| variable |
|:---------|:------------|-----------:|----------:|-----------:|----------:|:---------|
| a        | (Intercept) |   0.7894425|  0.0216124|  36.5272427|  0.0000000| rs       |
| a        | elev        |   0.0000650|  0.0000116|   5.5957913|  0.0000001| rs       |
| b        | (Intercept) |   0.6407635|  0.0152086|  42.1315370|  0.0000000| rs       |
| b        | elev        |   0.0001616|  0.0000085|  18.9489825|  0.0000000| rs       |
| c        | (Intercept) |   0.6884233|  0.0119237|  57.7357090|  0.0000000| rs       |
| c        | elev        |   0.0001454|  0.0000071|  20.5319672|  0.0000000| rs       |
| a        | (Intercept) |   0.6481512|  0.0207272|  31.2705042|  0.0000000| rt       |
| a        | elev        |   0.0000729|  0.0000111|   6.5452235|  0.0000000| rt       |
| b        | (Intercept) |   0.6324168|  0.0166069|  38.0816295|  0.0000000| rt       |
| b        | elev        |   0.0000971|  0.0000093|  10.4262251|  0.0000000| rt       |
| c        | (Intercept) |   0.6919481|  0.0124516|  55.5710547|  0.0000000| rt       |
| c        | elev        |   0.0000954|  0.0000074|  12.9012525|  0.0000000| rt       |
| a        | (Intercept) |   1.2130916|  0.0290269|  41.7920150|  0.0000000| rc       |
| a        | elev        |  -0.0000270|  0.0000156|  -1.7337065|  0.0841836| rc       |
| b        | (Intercept) |   1.0411809|  0.0203392|  51.1908890|  0.0000000| rc       |
| b        | elev        |   0.0000642|  0.0000114|   5.6307724|  0.0000000| rc       |
| c        | (Intercept) |   1.0092078|  0.0167636|  60.2022961|  0.0000000| rc       |
| c        | elev        |   0.0000521|  0.0000100|   5.2304183|  0.0000002| rc       |
| a        | (Intercept) |   0.1412912|  0.0205355|   6.8803354|  0.0000000| rrs      |
| a        | elev        |  -0.0000079|  0.0000110|  -0.7170877|  0.4739789| rrs      |
| b        | (Intercept) |   0.0083467|  0.0151993|   0.5491508|  0.5830935| rrs      |
| b        | elev        |   0.0000645|  0.0000085|   7.5688623|  0.0000000| rrs      |
| c        | (Intercept) |  -0.0035247|  0.0135782|  -0.2595875|  0.7952436| rrs      |
| c        | elev        |   0.0000500|  0.0000081|   6.1993248|  0.0000000| rrs      |

``` r
kable(reg_summ[,c(1:3,6,13)], caption = "Coefficients of Regression")
```

| clu\_pop |  r.squared|  adj.r.squared|    p.value| variable |
|:---------|----------:|--------------:|----------:|:---------|
| a        |  0.1097493|      0.1062443|  0.0000001| rs       |
| b        |  0.3594004|      0.3583994|  0.0000000| rs       |
| c        |  0.3274109|      0.3266342|  0.0000000| rs       |
| a        |  0.1443200|      0.1409512|  0.0000000| rt       |
| b        |  0.1451920|      0.1438564|  0.0000000| rt       |
| c        |  0.1612122|      0.1602436|  0.0000000| rt       |
| a        |  0.0116952|      0.0078043|  0.0841836| rc       |
| b        |  0.0472016|      0.0457129|  0.0000000| rc       |
| c        |  0.0306230|      0.0295036|  0.0000002| rc       |
| a        |  0.0020204|     -0.0019087|  0.4739789| rrs      |
| b        |  0.0821579|      0.0807238|  0.0000000| rrs      |
| c        |  0.0424926|      0.0413869|  0.0000000| rrs      |
