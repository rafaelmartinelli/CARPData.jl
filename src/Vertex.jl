struct BaseVertex{T}
    id::Int64

    edges::Vector{T}
    requireds::Vector{T}
end
