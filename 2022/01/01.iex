{:ok, contents} = File.read("/Users/guyeilam/dev/advent-of-code/2022/01/input.txt")

answer = String.split(contents, "\n\n")
|> Enum.map(&String.split(&1, "\n"))
|> Enum.map(fn ele ->
    ele |> Enum.reject(fn y -> y == "" end) |> Enum.map(&String.to_integer/1)
  end)
|> Enum.map(&Enum.sum/1)
|> Enum.max

part2 = String.split(contents, "\n\n")
|> Enum.map(&String.split(&1, "\n"))
|> Enum.map(fn ele ->
    ele |> Enum.reject(fn y -> y == "" end) |> Enum.map(&String.to_integer/1)
  end)
|> Enum.map(&Enum.sum/1)
|> Enum.sort
|> Enum.reverse
|> Enum.take(3)
|> Enum.sum
