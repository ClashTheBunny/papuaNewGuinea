#!/bin/sh

wget http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_populated_places.zip

unzip ne_10m_populated_places.zip ne_10m_populated_places.shp

ogr2ogr -f GeoJSON \
  -where "ISO_A2 = 'PG' AND SCALERANK < 10" places.json  ne_10m_populated_places.shp

topojson   -o png.json   --id-property gn_id   --properties  --  subunits.json places.json
