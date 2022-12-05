defmodule Day3 do
  @priorities %{
    a: 1,
    b: 2,
    c: 3,
    d: 4,
    e: 5,
    f: 6,
    g: 7,
    h: 8,
    i: 9,
    j: 10,
    k: 11,
    l: 12,
    m: 13,
    n: 14,
    o: 15,
    p: 16,
    q: 17,
    r: 18,
    s: 19,
    t: 20,
    u: 21,
    v: 22,
    w: 23,
    x: 24,
    y: 25,
    z: 26
  }
  def part1 do
    input =
      input_stream
      |> Stream.map(&items/1)
      |> Stream.map(&common_items/1)

    Enum.sum(input) |> IO.inspect()
  end

  def part2 do
    input =
      input_stream
      |> Stream.chunk_every(3)
      |> Stream.map(&common_items/1)

    Enum.sum(input) |> IO.inspect()
  end

  defp input_stream do
    File.stream!("/Users/guyeilam/dev/advent-of-code/2022/03/input.txt")
  end

  defp items(rucksack) do
    midpoint = Kernel.trunc(String.length(rucksack) / 2)
    [String.slice(rucksack, 0..(midpoint - 1)), String.slice(rucksack, midpoint..-1)]
  end

  defp common_items(contents) do
    compartment1 = Enum.at(contents, 0)
    compartment2 = Enum.at(contents, 1)
    compartment3 = get_compartment_3(contents)

    common_item =
      String.split(compartment1, "")
      |> Enum.filter(fn x -> x != "" end)
      |> Enum.find(fn ele ->
        with true <- is_nil(compartment3) do
          String.contains?(compartment2, ele)
        else
          false -> String.contains?(compartment2, ele) && String.contains?(compartment3, ele)
        end
      end)

    priority(common_item)
  end

  defp get_compartment_3(contents) do
    with true <- Enum.count(contents) == 3 do
      Enum.at(contents, 2)
    else
      false -> nil
    end
  end

  defp priority(item) do
    with true <- item == String.upcase(item) do
      Map.get(@priorities, String.to_atom(String.downcase(item))) + 26
    else
      false -> Map.get(@priorities, String.to_atom(item))
    end
  end
end

Day3.part1()
Day3.part2()
