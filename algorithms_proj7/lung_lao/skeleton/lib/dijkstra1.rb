require_relative 'graph'
require 'byebug'

# O(|V|**2 + |E|).
def dijkstra1(source)
	possible_paths = {}
	possible_paths[source] = {cost: 0, last_edge: nil}
	shortest_paths = {}

	while possible_paths.length > 0 do
		vertex, data = possible_paths.min_by { |k,v| v[:cost] }

		shortest_paths[vertex] = possible_paths[vertex]
		possible_paths.delete(vertex)

		vertex_cost = shortest_paths[vertex][:cost]

		vertex.out_edges.each do |edge|
			to_vertex = edge.to_vertex
			next if shortest_paths.has_key?(to_vertex)
			nxt_cost = vertex_cost + edge.cost
			next if possible_paths.has_key?(to_vertex) && 
							possible_paths[to_vertex][:cost] <= nxt_cost
			possible_paths[to_vertex] = { cost: nxt_cost, last_edge: edge }
		end
	end

	shortest_paths
end