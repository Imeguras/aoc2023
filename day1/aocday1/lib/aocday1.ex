defmodule Aocday1 do
  def start() do
    read_file
  end
  def read_file(function) do

    File.read!("input.txt")
    |> String.split("\n")
    |> function()

  end
  def discard_text(input) do
    input
    |> Enum.map(fn x -> String.replace(x, "[A-z]*", "") end)
  end
  def append_numbers(input) do
    input
    |> Enum.map(fn x -> Integer.parse() end)
  end
end
