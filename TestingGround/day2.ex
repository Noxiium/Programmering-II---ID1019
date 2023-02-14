defmodule Day2 do


  def run() do
    calculateScore(getInput)
  end

  def getInput() do
    {:ok, list} = File.read("input.txt")
    list = list |> String.split("\n")
    list = removeSpecialCharacter(list)
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(&List.to_tuple/1)
  end

  def removeSpecialCharacter(list) do
    fixUp(list, (fn(x) -> x |> String.replace("\r", "") end))
  end

  def fixUp([], _) do [] end
  def fixUp([h|t], f) do
    [f.(h) | fixUp(t, f)]
  end

  ## A,X = ROCK    = 1
  ## B,Y = PAPER   = 2
  ## C,Z = SCISSOR = 3
  ## LOST = 0
  ## DRAW = 3
  ## WIN = 6

  def calculateScore([]), do: 0
  def calculateScore([h|t]) do
    matchScore(h) + calculateScore(t)
  end

  def matchScore({"A", "X"}), do: 3+1
  def matchScore({"A", "Y"}), do: 6+2
  def matchScore({"A", "Z"}), do: 0+3

  def matchScore({"B", "X"}), do: 0+1
  def matchScore({"B", "Y"}), do: 3+2
  def matchScore({"B", "Z"}), do: 6+3

  def matchScore({"C", "X"}), do: 6+1
  def matchScore({"C", "Y"}), do: 0+2
  def matchScore({"C", "Z"}), do: 3+3


end
