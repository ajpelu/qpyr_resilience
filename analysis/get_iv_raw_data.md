### Get raw data

To obtain data of vegetation indices for *Q. pyrenaica* forests of Sierra Nevada, first we obtain the pixels covering these forest using the info stored into [obsnev](obsnev.es). 

#### Get lat/long data for all ndvi of SN 

```sql
SELECT
 iv.id, 
 ST_X(ST_Centroid(iv.the_geom)) as lng,
 ST_Y(ST_Centroid(iv.the_geom)) as lat
FROM 
 public.iv_malla_modis as iv;
```

Output result is stored as: `/data_raw/geoinfo/coordinates_iv_modis.csv`


With the centroids, we used the [MODISTool R-package](https://cran.r-project.org/web/packages/MODISTools/index.html) to donwload the data. See [this repo](https://github.com/ajpelu/modis_iv) with more info about the process. The raw data can be found [here](https://raw.githubusercontent.com/ajpelu/modis_iv/master/data/iv_quercus_pyrenaica.csv)

#### Old version

We obtain the data of vegetation indices for the pixels covering *Q. pyrenaica* populations in Sierra Nevada using the centroids of the pixels 

A query to obtain raw data by pixel (only pixels covering *Q. pyrenaica* populations in Sierra Nevada)

```sql 
SELECT 
  iv.iv_malla_modi_id, 
  iv.fecha, 
  iv.evi, 
  iv.ndvi,
  iv.red_reflectance as red, 
  iv.nir_reflectance as nir, 
  iv.blue_reflectance as blue, 
  iv.composite_day_year,
  aux.lng, 
  aux.lat, 
  aux.poblacion 
FROM 
  public.aux_ms_ontologias_iv_malla_modis_completa as aux, 
  public.iv_modis as iv
WHERE 
  aux.id = iv.iv_malla_modi_id;
```

Ouput result is saved as: `/data_raw/evi/raw_iv.csv`  

### Get lat/long data for all ndvi of SN 

```sql
SELECT
 iv.id, 
 ST_X(ST_Centroid(iv.the_geom)) as lng,
 ST_Y(ST_Centroid(iv.the_geom)) as lat
FROM 
 public.iv_malla_modis as iv;
```

Output result is stored as: `/data_raw/geoinfo/coordinates_iv_modis.csv`