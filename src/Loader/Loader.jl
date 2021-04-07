include("../Data/Data.jl")

function load(instance::Symbol)
    name = string(instance)
    file_name = joinpath(data_path, name * ".dat")

    values = parse.(Int64, split(read(file_name, String)))

    n = values[1]
    vertices = Vector{Vertex{Edge}}()
    for v in 1:n
        push!(vertices, Vertex{Edge}(v, Vector{Edge}(), Vector{Edge}()))
    end

    m = values[2]
    edges = Vector{Edge}()
    requireds = Vector{Edge}()

    i = 3
    for e = 1:m
        from = vertices[values[i] + 1]
        to = vertices[values[i + 1] + 1]
        cost = values[i + 2]
        demand = values[i + 3]
        i += 4

        edge = Edge(e, from, to, cost, demand)
        
        push!(edges, edge)
        push!(from.edges, edge)
        push!(to.edges, edge)

        if isRequired(edge)
            push!(requireds, edge)
            push!(from.requireds, edge)
            push!(to.requireds, edge)
        end
    end

    vehicles = values[i]
    capacity = values[i + 1]

    lb = values[i + 2]
    ub = values[i + 3]

    data = Data(name, capacity, vehicles, vertices, edges, requireds, lb, ub)

    return data
end
