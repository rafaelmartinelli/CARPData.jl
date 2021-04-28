struct Edge
    id::Int64

    from::BaseVertex{Edge}
    to::BaseVertex{Edge}

    cost::Int64
    demand::Int64
end

const Vertex = BaseVertex{Edge}

isRequired(edge::Edge) = edge.demand > 0
