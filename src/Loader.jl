include("Data.jl")

function load(instance::Symbol)
    instance = replace(string(instance), "_" => "-")
    file_name = joinpath(data_path, instance * ".dat")
    return load(file_name)
end

function load(file_name::AbstractString)
    if !isfile(file_name)
        println("Error loading file ", file_name)
        return nothing
    end

    values = parse.(Int64, split(read(file_name, String)))
    name = splitext(basename(file_name))[1]

    n = values[1]
    vertices = Vector{Vertex}()
    for v in 1:n
        push!(vertices, Vertex(v, Vector{Edge}(), Vector{Edge}()))
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
