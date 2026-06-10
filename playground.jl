
# To use: cut and paste section of interest; each section is actually commented out so you can't load this file directly

#= TIMESTAMP 20260610.072430

using GeoDataFrames
using ZipFile
using ArchGDAL

# let's create a function takes a shapefile name and returns a matrix indicating category of each pixel

# let's test with Canadian provinces using the /vsizip protocol

# these are the input variables

s = "/vsizip/GADM/gadm41_CAN_shp.zip/gadm41_CAN_shp.zip/gadm41_CAN_1.shp"
h = 8192
w = 16384

# load the data using GeoDataFrames

my_data = GeoDataFrames.read(s)






# I assume you've downloaded gadm.org shapefiles to GADM

@time myMasks = Rasters.boolmask(myData; to = myExt, size=(my_w, my_h), collapse = false, boundary = :touches);



TIMESTAMP 20260610.072430 =#