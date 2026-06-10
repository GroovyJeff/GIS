# lazy import doesn't always work, so this creates a regular import file just in case

mylib-import-nonlazy.jl: mylib-import-lazy.jl
	sed 's/LazyModules.@lazy //; s/ = .*//' mylib-import-lazy.jl | sort -u > mylib-import-nonlazy.jl

