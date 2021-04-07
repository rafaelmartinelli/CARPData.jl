struct Edge
    id::Int64

    from::Vertex{Edge}
    to::Vertex{Edge}

    cost::Int64
    demand::Int64
end

isRequired(edge::Edge) = edge.demand > 0
