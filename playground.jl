
# To use: cut and paste section of interest; each section is actually commented out so you can't load this file directly

#= TIMESTAMP 20260610.072430

include("mylib-import-lazy.jl")

# let's create a function takes a shapefile name and returns a matrix indicating category of each pixel

# let's test with Canadian provinces using the /vsizip protocol

# these are the input variables (we keep track of type because we want our function signature to look good)

s::String = "/vsizip/GADM/gadm41_CAN_shp.zip/gadm41_CAN_1.shp"

h::Int64 = 8192
w::Int64 = 16384

# load the data using GeoDataFrames (we ignore type for "temporary" variables)

my_data = GeoDataFrames.read(s)

# create an extent for the matrix

my_extent = Extents.Extent(X=(-180, 180), Y=(-90, 90))

my_rasters =  Rasters.boolmask(my_data; to = my_extent, size=(w,h), collapse = false, boundary=:touches);












# I assume you've downloaded gadm.org shapefiles to GADM

@time myMasks = Rasters.boolmask(myData; to = myExt, size=(my_w, my_h), collapse = false, boundary = :touches);



TIMESTAMP 20260610.072430 =#