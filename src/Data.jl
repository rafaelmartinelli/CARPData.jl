include("Vertex.jl")
include("Edge.jl")

struct Data
    name::String

    capacity::Int64
    vehicles::Int64

    vertices::Vector{Vertex}
    edges::Vector{Edge}
    requireds::Vector{Edge}

    lb::Int64
    ub::Int64
end
