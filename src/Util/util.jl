function Base.show(io::IO, data::Data)
    print(io, "CARP Data $(data.name)")
    print(io, " ($(length(data.vertices)) nodes,")
    print(io, " $(length(data.edges)) edges,")
    print(io, " $(length(data.requireds)) reqs)")
    print(io, " [$(data.lb), $(data.ub)]")
end
