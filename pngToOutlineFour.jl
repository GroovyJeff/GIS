import Images
import Serialization
import ImageFiltering
import Glob

# applies a convolution kernel to the images in MAPS/ to create edges-only maps

function pngToOutline(filename)

 # load the image and apply a kernel to remove points with all cardinal neighbors present, and clamp values to 0, 1 (monochrome image)

 img = clamp.(ImageFiltering.imfilter(Images.load(filename), [0 -1 0; -1 4 -1; 0 -1 0], ImageFiltering.Fill(0)), 0, 1)

 # rename the image as -convolve-four and save

 Images.save(replace(filename, ".png" => "")*"-convolve-four.png", img)

end

for i in Glob.glob("MAPS/gadm41-???.png")
 println("PROCESSING: $i")
 pngToOutline(i)
end
