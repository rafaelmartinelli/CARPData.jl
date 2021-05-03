module CARPData

import Base: show

export Data, Vertex, Edge, load, isRequired

const data_path = joinpath(pkgdir(CARPData), "data")

include("Vertex.jl")
include("Edge.jl")
include("Data.jl")
include("Loader.jl")
include("Util.jl")

end
