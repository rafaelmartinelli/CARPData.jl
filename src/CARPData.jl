module CARPData

import Base: show

export Data, Vertex, Edge, load

const data_path = joinpath(pkgdir(CARPData), "data")

include("Loader/Loader.jl")
include("Util/util.jl")

end
