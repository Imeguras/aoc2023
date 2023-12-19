defmodule Aocday1 do
  def start(_type, _args) do

    f=read_file()
    |> Enum.sum()

    IO.inspect(f)

    children = [

    ]


    opts = [strategy: :one_for_one, name: A.Supervisor]
    Supervisor.start_link(children, opts)


  end

  def read_file() do

    File.read("../input.txt")
    |> text_parse



  end
  defp text_parse({:ok, file}) do
    file
    |> String.split("\n")
    |> Enum.filter(fn x -> x != "" end)
    |> replace_numbersText
    |> discard_text
    |> discard_mid_chars
    |> append_numbers

  end

  defp text_parse({:error, reason}) do
    IO.puts("Error: #{reason}")
  end
  def replace_numbersText(input) do
     dictionary = [
      {"oneight", "18"},
      {"twone", "21"},
      {"fiveight", "58"},
      {"sevenine", "79"},
      {"eightwo", "82"},
      {"eighthree", "83"},
      {"nineight", "98"},

      {"one", "1"},
      {"two", "2"},
      {"three", "3"},
      {"four", "4"},
      {"five", "5"},
      {"six", "6"},
      {"seven", "7"},
      {"eight", "8"},
      {"nine", "9"}

    ]
    input
    |> Enum.map(fn x -> Enum.reduce(dictionary,x, fn {a,b}, acc-> String.replace(acc,a,b) end) end)



  end
  def discard_text(input) do
    input

    |> Enum.map(fn x -> Regex.replace(~r/[^0-9]+/ ,x, "") end)
  end
  def discard_mid_chars(input) do
    input
    |> Enum.map(fn x -> {String.slice(x, 0, 1), String.slice(x, -1, 1)} end)
    |> Enum.map(fn {x, y} -> x <> y end)




  end
  def append_numbers(input) do
    input
    |> Enum.map(fn x -> Integer.parse(x) end)
    |> Enum.map(fn {x, _} -> x end)



  end
end
