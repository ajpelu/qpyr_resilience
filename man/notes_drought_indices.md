# Drought indices

## The Palmer Drought Severity Index (PDSI)

* It enables measurement of both wetness and dryness based on the supply and demand concept of the water balance equation 
* It incorporates prior precipitation, moisture supply, runoff and evaporation demand at the surface level. 
* scPDSI solves many of the problems of PDSI
 * it is spatially comparable 
* Shortcomings 
 * fixed temporal scale (9 - 12 months)
 * Autorregresive problems: index values are affected by the conditions up to four years in the past 
 
## The Standardised Precipitation Index (SPI)

* It is a multiscalar index 
* 


* The SPI for long-term time scales (3 - 6 months) is considered an agricultural drought index (McKee et al., 1993, 1995; Hayes et al., 1999) because it indicates the water content of vegetation and the soil moisture conditions (Sims et al., 2002; Ji and Peters, 2003).

* The SPI at 12 months is considered a hydrological drought index, because it is used for monitoring surface water resources, e.g. river flows (Szalai et al., 2000; Hayes et al., 1999). 




## SPEI 
* We decided to use SPEI index as it accounts for the sensivity to temperature of PDSI and it has the multiscalar nature of SPI (See Vicente-Serrano et al. 2010)

* We will use the [SPEI R-package](https://cran.r-project.org/web/packages/SPEI/index.html) to compute SPEI index at several stations closed to Pyrenean oak population of Sierra Nevada.  

* We explore the drought indices using by **REDIAM**. It uses the *Indice estandarizado de Sequía Pluviométrica (IESP)* that is based on anomalies (a full description can be found [here](http://www.climasig.es/metod2.html#i9). It's a similar approach than SPI, but it does not account the effect of the increased temperatured (see Vicente-Serrano et al. 2010)

### Selection of the climatic stations from obsnev.es 
* First, locate the stations closed to Pyrenean oak populations

![Figure 1.](/man/images/cli_stations_camarate.png) 
![Figure 2.](/man/images/cli_stations_northern.png)
![Figure 3.](/man/images/cli_stations_southern.png)


## Examples of drought in Iberian Peninsula
* [Overview of 2005 drought](http://earthobservatory.nasa.gov/NaturalHazards/view.php?id=14719)
* [images comparison](http://earthobservatory.nasa.gov/NaturalHazards/view.php?id=14717) 





## Drought over Iberian Peninsula 
* 2004/2005 hydrological year was characterized by one of the worst droughts ever recorded in the Iberian Peninsula (García-Herrera et al. 2007). Less than 40 % of the climatological precipitation being registered in the southern sectors

* During the hydrological years of 2004/2005 and 2011/2012, Iberia was hit by two of the worst drought episodes ever recording in this semi-arid region (Garcia-Herrera at al., 2007; Trigo et al., 2013).


* Effects of droughts on plant phenology (NDVI) are visible, especially for the years 1999 and 2005 (both characterized by prolonged dry periods)


* Read two good papers about extreme climatic events
 * http://onlinelibrary.wiley.com/doi/10.1111/j.1365-2745.2011.01833.x/full 
 * http://onlinelibrary.wiley.com/doi/10.1111/j.1365-2745.2011.01798.x/full

## More notes: 

* See Chaparro et al. to describe the two drougth periods 

## References: 

* Vicente-Serrano et al. 2010. A Multiscalar Drought Index Sensitive to Global Warming: The Standardized
Precipitation Evapotranspiration Index. doi: 10.1175/2009JCLI2909.1




