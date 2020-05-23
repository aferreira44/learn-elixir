defmodule M do
    def main do
        name = IO.gets("What's your name? ") |> String.trim
        IO.puts "Hello #{name}"
    end
end