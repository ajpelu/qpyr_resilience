Compute resilience values of *Q. pyrenaica* for EVI values
==========================================================

``` r
library("dplyr")
library("ggplot2")
library("reshape2")
```

Introduction
------------

-   Read data of EVI attributes (see this [script](/analysis/prepare_evi_data.md))

``` r
# Read data
evidf <- read.csv(file=paste(di, "/data/evi_atributes_all.csv", sep=""), header = TRUE, sep = ',')
```

Exploring evolution of EVI by season
------------------------------------

-   First we explore the evolution of EVI by season. We want to ask the question: *¿Which temporal scale does capture better the impacts of the drought event?*

``` r
ggplot(evidf, aes(x=year, y=evi, group=year)) + 
  geom_boxplot() + 
  facet_wrap(~seasonF, scales = "free_y") + 
  theme_bw() + 
  theme(strip.background=element_rect(fill='white')) + 
  ylab('EVI')
```

![Evolution of seasonal and annual EVI for Q. pyrenaica forests in S.Nevada (2000-2014)](compute_resilience_files/figure-markdown_github/unnamed-chunk-2-1.png)

``` r
evidf %>% 
  filter(seasonF %in% c('spring','summer')) %>% 
  group_by(year) %>% 
  ggplot(aes(x=year, y=evi, group=year)) +
  geom_boxplot() + theme_bw() + 
  facet_wrap(~seasonF) +
  theme(strip.background=element_rect(fill='white')) + 
  ylab('seasonal EVI')
```

![](compute_resilience_files/figure-markdown_github/unnamed-chunk-3-1.png)

Define the drought period
-------------------------

-   Another key step is to define the number of drought events and the **time span** of the events. For this purpose we review some literature ([1], [2], [3]). Some notes:

> Note: Drougths events.
>
> According to García-Herrera et al. 2007, the 6 greater droughts events recorded in Granada station from 1941 to 2005 were: 44-45, 48-49, 49-50, 92-93, 94-95, and 98-99.
>
> Trigo et al. 2013 reported a winter drought event for souther Iberian in 2011-2012.
>
> During the hydrological years of 2004/2005 and 2011/2012, Iberia was hit by two of the worst drought episodes ever recording in this semi-arid region (Gouveia and Trigo 2014)

We consider two drought events: 2005 and 2012. We stats the following periods:

| **Type**      | Event | *code*  | *years*   | code\_type |
|---------------|-------|---------|-----------|------------|
| pre Drought   | 1     | `pre1`  | 2002-2004 | pre        |
| Drought event | 1     | `dr1`   | 2005      | dr         |
| post Drought  | 1     | `post1` | 2006-2008 | post       |
| pre Drought   | 2     | `pre2`  | 2009-2011 | pre        |
| Drought event | 2     | `dr2`   | 2012      | dr         |
| post Drought  | 2     | `post2` | 2013-2015 | post       |

``` r
# define periods 
pre1 <- c(2002,2003,2004)
dr1 <- c(2005)
post1 <- c(2006,2007,2008)
pre2 <- c(2009,2010,2011)
dr2 <- c(2012)
post2 <- c(2013,2014,2015)
```

Assign, also, names for each *Q. pyrenaica* patch:

``` r
# names of populations
label_pop <- c('1' = 'Lugros', '2' = 'Guejar-Sierra', '3' = 'Monachil',
                      '4' = 'Dilar', '5' = 'Durcal', '6' = 'Caniar', 
                      '7' = 'Poqueira', '8' = 'Trevelez', '9' = 'Cadiar')
```

Explore evolution of EVI
------------------------

-   Explore evolution of EVI summer, spring or annual
-   Filter data to period consider (`min(pre)` - `max(post)`)
-   Plot the evolution of EVI summer, spring or annual
-   Categorize summer, spring or annual EVI value into `pre`, `dr` and `post` leveles according to drought events defined above

### Summer

``` r
# Choose season
myseason <- 'summer'

evidf %>%
  filter(seasonF == myseason) %>% 
  ggplot(aes(x=year, y=evi, group=year)) + 
  geom_boxplot() + facet_wrap(~pop, labeller = as_labeller(label_pop)) + 
  ggtitle(paste0(myseason, ' EVI')) + 
  theme_bw() + 
  theme(strip.background=element_rect(fill='white'))
```

![Evolution of summer EVI for Q. pyrenaica forests in S.Nevada](compute_resilience_files/figure-markdown_github/unnamed-chunk-6-1.png)

``` r
# Categorize events drought data in Summer 
event1_summer <- evidf %>%
  filter(seasonF == myseason) %>% 
  filter(year <= max(pre1,dr1,post1)) %>% 
  mutate(disturb = ifelse(year %in% pre1, 'pre', 
                           ifelse(year %in% dr1, 'dr',
                           ifelse(year %in% post1, 'post', 'out'))),
         event = 1,
         dist_event = paste0(disturb, event)) %>%
  filter(disturb != 'out') 

event2_summer <- evidf %>%
  filter(seasonF == myseason) %>% 
  filter(year >= min(pre2,dr2,post2)) %>% 
  mutate(disturb = ifelse(year %in% pre2, 'pre', 
                           ifelse(year %in% dr2, 'dr',
                           ifelse(year %in% post2, 'post', 'out'))),
         event = 2,
         dist_event = paste0(disturb, event)) %>%
  filter(disturb != 'out') 
```

###  Spring

``` r
# Choose season
myseason <- 'spring'

evidf %>%
  filter(seasonF == myseason) %>% 
  ggplot(aes(x=year, y=evi, group=year)) + 
  geom_boxplot() + facet_wrap(~pop, labeller = as_labeller(label_pop)) + 
  ggtitle(paste0(myseason, ' EVI')) + 
  theme_bw() + 
  theme(strip.background=element_rect(fill='white'))
```

![Evolution of spring EVI for Q. pyrenaica forests in S.Nevada](compute_resilience_files/figure-markdown_github/unnamed-chunk-8-1.png)

``` r
# Categorize events drought data in Spring 
event1_spring <- evidf %>%
  filter(seasonF == myseason) %>% 
  filter(year <= max(pre1,dr1,post1)) %>% 
  mutate(disturb = ifelse(year %in% pre1, 'pre', 
                           ifelse(year %in% dr1, 'dr',
                           ifelse(year %in% post1, 'post', 'out'))),
         event = 1,
         dist_event = paste0(disturb, event)) %>%
  filter(disturb != 'out') 

event2_spring <- evidf %>%
  filter(seasonF == myseason) %>% 
  filter(year >= min(pre2,dr2,post2)) %>% 
  mutate(disturb = ifelse(year %in% pre2, 'pre', 
                           ifelse(year %in% dr2, 'dr',
                           ifelse(year %in% post2, 'post', 'out'))),
         event = 2,
         dist_event = paste0(disturb, event)) %>%
  filter(disturb != 'out') 
```

###  Annual

``` r
# Choose season
myseason <- 'annual'

evidf %>%
  filter(seasonF == myseason) %>% 
  ggplot(aes(x=year, y=evi, group=year)) + 
  geom_boxplot() + facet_wrap(~pop, labeller = as_labeller(label_pop)) + 
  ggtitle(paste0(myseason, ' EVI')) + 
  theme_bw() + 
  theme(strip.background=element_rect(fill='white'))
```

![Evolution of annual EVI for Q. pyrenaica forests in S.Nevada](compute_resilience_files/figure-markdown_github/unnamed-chunk-10-1.png)

``` r
# Categorize events drought data in Spring 
event1_annual <- evidf %>%
  filter(seasonF == myseason) %>% 
  filter(year <= max(pre1,dr1,post1)) %>% 
  mutate(disturb = ifelse(year %in% pre1, 'pre', 
                           ifelse(year %in% dr1, 'dr',
                           ifelse(year %in% post1, 'post', 'out'))),
         event = 1,
         dist_event = paste0(disturb, event)) %>%
  filter(disturb != 'out') 

event2_annual<- evidf %>%
  filter(seasonF == myseason) %>% 
  filter(year >= min(pre2,dr2,post2)) %>% 
  mutate(disturb = ifelse(year %in% pre2, 'pre', 
                           ifelse(year %in% dr2, 'dr',
                           ifelse(year %in% post2, 'post', 'out'))),
         event = 2,
         dist_event = paste0(disturb, event)) %>%
  filter(disturb != 'out') 
```

Compute resilience components
=============================

-   Compute the resiliencie components according to (Lloret et al. 2011)([4]) (see also this [notes](/man/notes_drought_in.md)): ***Resistence*** (`rt`); ***Resilience*** (`rs`) and ***Recovery*** (`rc`).
-   These inidcators were computed at pixel scale. For this purpose we aggregated the values of each period by pixel (*i.e.*: mean values of summer EVI for several years)
-   We also retain the attributes of `population` and coordinates (`lat` and `lng`)
-   Finally we export the dataframe generate ([`/data/evi_resilience.csv`](/data/evi_resilience.csv))

``` r
# First aggregate each pixel by period (get mean value of evi by period) 
# Compute for the two dataframes (event1, event2)

# function to compute Resilience 
computeResilience <- function(df){ 
  # Group by period and get mean of evi by pixel
  eviperiod <- df %>%
    select(iv_malla_modi_id, pop, evi, disturb, long, lat, event, dist_event) %>%
    group_by(iv_malla_modi_id, disturb, pop, long, lat, event, dist_event) %>% 
    summarise(media_period = mean(evi),
              sd_period = sd(evi),
              se_period = sd_period/sqrt(length(evi)))
  
  # Change format of the dataset (long to wide)
  df_aux <- dcast(eviperiod, iv_malla_modi_id + pop + long + lat  ~ disturb, value.var = 'media_period')
  
  # Compute components of resilience 
  eviresi <- df_aux %>% 
    mutate(rt = dr / pre,
           rc = post / dr,
           rs = post / pre) %>%
    mutate(rrs = ((post - dr) / pre)) 
  } 
```

``` r
res_event1_annual <- computeResilience(event1_annual)
res_event1_annual <- res_event1_annual %>% mutate(event=1, seasonF = 'annual')

res_event2_annual <- computeResilience(event2_annual)
res_event2_annual <- res_event2_annual %>% mutate(event=2, seasonF = 'annual')


res_event1_spring <- computeResilience(event1_spring)
res_event1_spring <- res_event1_spring %>% mutate(event=1, seasonF = 'spring')

res_event2_spring <- computeResilience(event2_spring)
res_event2_spring <- res_event2_spring %>% mutate(event=2, seasonF = 'spring')


res_event1_summer <- computeResilience(event1_summer)
res_event1_summer <- res_event1_summer %>% mutate(event=1, seasonF = 'summer')

res_event2_summer <- computeResilience(event2_summer)
res_event2_summer <- res_event2_summer %>% mutate(event=2, seasonF = 'summer')

# Export dataframes
evi_resilience <- rbind(res_event1_annual, res_event2_annual, res_event1_spring, res_event2_spring, res_event1_summer, res_event2_summer)
write.csv(evi_resilience, file=paste(di, "/data/evi_resilience.csv", sep=""), row.names = FALSE)
```

References
----------

-   -   -   -   

[1] Garcia-Herrera R, Paredes D, Trigo RM, Trigo IF, Hernandez E, Barriopedro D, Mendes MA (2007). The Outstanding 2004/05 Drought in the Iberian Peninsula: Associated Atmospheric Circulation. *Journal of Hydrometeorology*, 8: 483–498.

[2] Trigo RM, Añel J, Barriopedro D, García-Herrera R, Gimeno L, Nieto R, Castillo R, Allen MR, Massey N (2013). The record Winter drought of 2011-12 in the Iberian Peninsula \[in *"Explaining Extreme Events of 2012 from a Climate Perspective"*. \[Peterson TC, Hoerling MP, Stott PA Herring S (Eds.)\]. *Bulletin of the American Meteorological Society*, 94 (9): S41-S45.

[3] Gouveia CM and Trigo RM (2014) The 2005 and 2012 major drought events in Iberia: monitoring vegetation dynamics and crop yields using satellite data. EGU General Assembly Conference. Vol 16, EGU2014-15179-1. <http://meetingorganizer.copernicus.org/EGU2014/EGU2014-15179-1.pdf>

[4] Lloret F, Keeling EG, Sala A (2011) Components of tree resilience: effects of successive low-growth episodes in old ponderosa pine forests. *Oikos* 120: 1909–1920.
