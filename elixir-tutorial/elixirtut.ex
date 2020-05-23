defmodule M do
    def main do
        # data_stuff()
    end

    def data_stuff do
        my_int = 123
        my_float = 3.14159
        my_str = "My Sentence"

        IO.puts "Integer #{is_integer my_int}"
        IO.puts "Float #{is_float my_float}"
        IO.puts "Atom #{is_atom :Pittsburgh}"
        IO.puts "Length : #{String.length my_str}"

        one_to_10 = 1..10

        longer_str = my_str <> " " <> "is longer"
        IO.puts "Equal : #{"Egg" === "egg"}"
        IO.puts "My ? #{String.contains? my_str, "My"}"
        IO.puts "First : #{String.first my_str}"
        IO.puts "Index 4 : #{String.at my_str, 4}"
        IO.puts "Substring : #{String.slice my_str, 3, 8}"

        IO.inspect String.split(longer_str, " ")

        IO.puts String.reverse longer_str
        IO.puts String.upcase longer_str
        IO.puts String.downcase longer_str
        IO.puts String.capitalize longer_str

        # Pipe
        4 * 10 |> IO.puts
    end
end