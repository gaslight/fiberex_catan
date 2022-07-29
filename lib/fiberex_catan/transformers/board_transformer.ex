defmodule FiberexCatan.BoardTransformer do
  def transform(board) do
    board
    |> transform_tiles()
    |> transform_vertices()
    |> transform_edges()
  end

  def transform_tiles(%{tiles: tiles} = board) do
    transformed_tiles =
      tiles
      |> Enum.map(fn {location, tile_properties} ->
        Map.put(tile_properties, :location, location)
      end)

    Map.put(board, :tiles, transformed_tiles)
  end

  def transform_vertices(%{vertices: vertices} = board) do
    transformed_vertices =
      vertices
      |> Enum.map(fn {location, vertex_properties} ->
      Map.put(vertex_properties, :location, location)
    end)

      Map.put(board, :vertices, transformed_vertices)
  end

  def transform_edges(%{edges: edges} = board) do
    transformed_edges =
      edges
      |> Enum.map(fn {location, edge_properties} ->
      Map.put(edge_properties, :location, location)
    end)

      Map.put(board, :edges, transformed_edges)
  end
end
