defmodule Day2 do
  @shape_points %{
    X: 1,
    Y: 2,
    Z: 3
  }

  @outcome_points %{
    AX: 3,
    AY: 6,
    AZ: 0,
    BX: 0,
    BY: 3,
    BZ: 6,
    CX: 6,
    CY: 0,
    CZ: 3
  }

  @implied_outcome_points %{
    X: 0,
    Y: 3,
    Z: 6
  }

  def part1 do
    input_stream =
      File.stream!("/Users/guyeilam/dev/advent-of-code/2022/02/input.txt")
      |> Stream.map(&get_points/1)

    Enum.sum(input_stream) |> IO.inspect()
  end

  def part2 do
    input_stream =
      File.stream!("/Users/guyeilam/dev/advent-of-code/2022/02/input.txt")
      |> Stream.map(&get_implied_move/1)
      |> Stream.map(&get_points/1)

    Enum.sum(input_stream) |> IO.inspect()
  end

  defp get_points(move) do
    get_shape_points(move) + get_outcome_points(move)
  end

  defp get_shape_points(move) do
    key =
      String.to_atom(String.replace(move, "\n", "") |> String.replace(" ", "") |> String.at(-1))

    {:ok, shape_points} = Map.fetch(@shape_points, key)
    shape_points
  end

  defp get_outcome_points(move) do
    key = String.to_atom(String.replace(move, "\n", "") |> String.replace(" ", ""))
    {:ok, outcome_points} = Map.fetch(@outcome_points, key)
    outcome_points
  end

  defp get_implied_move(move) do
    opponent_move = String.at(move, 0)
    outcome = String.at(move, 2)
    implied_outcome_points = Map.get(@implied_outcome_points, String.to_atom(outcome))

    implied_move =
      Map.filter(@outcome_points, fn {k, v} ->
        String.at(Atom.to_string(k), 0) == opponent_move && v == implied_outcome_points
      end)
      |> Map.keys()
      |> List.first()
      |> Atom.to_string()
  end
end

Day2.part1()
Day2.part2()
