module CARPData

import Base: show

export Data, Vertex, Edge, load

const data_path = joinpath(pkgdir(CARPData), "data")

include("Loader.jl")
include("Util.jl")

end
