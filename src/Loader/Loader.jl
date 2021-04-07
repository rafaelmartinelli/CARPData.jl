include("../Data/Data.jl")

function load(file_name::String)
    name = replace(replace(file_name, r".*/" => ""), r"\..*" => "")

    values = parse.(Int64, split(read(file_name, String)))

    n = values[1]
    vertices = Vector{Vertex{Edge}}()
    for v in 1:n
        push!(vertices, Vertex{Edge}(v, Vector{Edge}()))
    end

    m = values[2]
    edges = Vector{Edge}()
    requireds = Vector{Edge}()

    i = 3
    for e = 1:m
        from = values[i] + 1
        to = values[i + 1] + 1
        cost = values[i + 2]
        demand = values[i + 3]

        edge = Edge(e, vertices[from], vertices[to], cost, demand)
        push!(edges, edge)
        if isRequired(edge) push!(requireds, edge) end

        i += 4
    end

    vehicles = values[i]
    capacity = values[i + 1]

    lb = values[i + 2]
    ub = values[i + 3]

    data = Data(name, capacity, vehicles, vertices, edges, requireds, lb, ub)

    return data
end
