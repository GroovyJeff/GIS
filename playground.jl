# To use: cut and paste section of interest; each section is actually commented out so you can't load this file directly

# these includes are universal to all sections

include("mylib-import-lazy.jl")
include("mylib.jl")

#= TIMESTAMP 20260610.072430

# adding libs here for standalone

using GeoDataFrames
using Extents
using Rasters
using ImageMorphology
using NearestNeighbors
using Distances

# optional
using CairoMakie


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

my_rasters =  Rasters.boolmask(my_data; to = my_extent, size=(h,w), collapse = false, boundary=:touches);

my_raster = my_rasters[:, :, 1];

# CairoMakie.heatmap(my_raster)

se = strel_diamond((3, 3));
interior = erode(my_raster, se);
boundary_raster = my_raster .&& .!interior;

my_result = DimensionalData.DimPoints(boundary_raster)[findall(boundary_raster)];


# data_matrix = Matrix{Float64}(undef, 2, length(raw_pts))

# data_matrix = hcat([[deg2rad(p[1]), deg2rad(p[2])] for p in my_result]...)

# flipped above, Haversine is lat, lng

data_matrix = hcat([[p[2], p[1]] for p in my_result]...);

data_matrix = hcat([[p[1], p[2]] for p in my_result]...);


tree = BallTree(data_matrix, Haversine(1.0))

# tests below

nn(tree, [90, 0])


dx = 360.0 / 16384
dy = 180.0 / 8192

x_range = deg2rad.((-180.0 + dx/2):dx:(180.0 - dx/2))
y_range = deg2rad.((-90.0 + dy/2):dy:(80.0 - dy/2))

query_points = [[x, y] for x in x_range, y in y_range]

distance_grid = ThreadsX.map(pt -> knn(tree, pt, 1)[2][1], query_points)





# Images.save("foo.png", my_rasters)
# Images.save("foo.png", my_rasters[:, :, 1])

optional(1, pwd())












# I assume you've downloaded gadm.org shapefiles to GADM

@time myMasks = Rasters.boolmask(myData; to = myExt, size=(my_w, my_h), collapse = false, boundary = :touches);



TIMESTAMP 20260610.072430 =#