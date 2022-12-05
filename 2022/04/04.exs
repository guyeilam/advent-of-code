defmodule Day4 do
  def part1 do
    input =
      input_stream
      |> Stream.map(&ranges/1)
      |> Stream.map(&overlaps/1)

    # |> Stream.map(&IO.inspect/1)

    Enum.sum(input) |> IO.inspect()
  end

  def part2 do
  end

  defp input_stream do
    File.stream!("/Users/guyeilam/dev/advent-of-code/2022/04/input.txt")
    |> Stream.map(&String.trim_trailing(&1, "\n"))
  end

  defp ranges(pair) do
    String.split(pair, ",")
    |> Enum.map(&String.split(&1, "-"))
  end

  defp overlaps(pair) do
    range1 =
      Range.new(
        Enum.at(pair, 0) |> Enum.at(0) |> String.to_integer(),
        Enum.at(pair, 0) |> Enum.at(1) |> String.to_integer(),
        1
      )

    range2 =
      Range.new(
        Enum.at(pair, 1) |> Enum.at(0) |> String.to_integer(),
        Enum.at(pair, 1) |> Enum.at(1) |> String.to_integer(),
        1
      )

    with true <-
           Enum.any?(range1, fn ele -> Enum.member?(range2, ele) end) or
             Enum.any?(range2, fn ele -> Enum.member?(range1, ele) end) do
      1
    else
      false -> 0
    end
  end
end

Day4.part1()
