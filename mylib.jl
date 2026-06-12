# it's sometimes useful to only run commands when testing or when a graphics environment is available; the default is to do nothing optional

OPTIONAL = 0

"""
    optional(mask, e)
Executes and returns `e` if the mask matches.
"""
function optional(mask, e)
    if (OPTIONAL & mask) != 0
     if e isa String println(e) end
     return Core.eval(Main, e)
    end
end
