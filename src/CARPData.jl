module CARPData

import Base: show

export Data, Vertex, Edge, load

include("Loader/Loader.jl")
include("Util/util.jl")

end
