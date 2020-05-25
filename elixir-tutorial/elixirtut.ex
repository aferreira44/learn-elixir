defmodule M do
    def main do
        # data_stuff()
        do_stuff()
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

    def do_stuff do
        IO.puts "5 + 4 = #{5+4}"
        IO.puts "5 - 4 = #{5-4}"
        IO.puts "5 * 4 = #{5*4}"
        IO.puts "5 / 4 = #{5/4}"
        IO.puts "5 div 4 = #{div 5, 4}"
        IO.puts "5 rem 4 = #{rem 5, 4}"

        IO.puts "4 == 4.0 : #{4 == 4.0}"
        IO.puts "4 === 4.0 : #{4 === 4.0}"
        IO.puts "4 != 4.0 : #{4 != 4.0}"
        IO.puts "4 !== 4.0 : #{4 !== 4.0}"

        IO.puts "5 > 4 : #{5 > 4}"
        IO.puts "5 >= 4 : #{5 >= 4}"
        IO.puts "5 < 4 : #{5 < 4}"
        IO.puts "5 <= 4 : #{5 <= 4}"

        age = 16

        IO.puts "Vote and drive : #{age >= 16 and age >= 18}"
        IO.puts "Vote or drive : #{age >= 16 or age >= 18}"

        IO.puts not true

        if age >= 18 do
            IO.puts "Can vote"
        else
            IO.puts "Can't vote"
        end

        unless age === 18 do
            IO.puts "You're not 18"
        else
            IO.puts "You are 18"
        end

        cond do
            age >= 18 -> IO.puts "You can Vote"
            age >= 16 -> IO.puts "You can drive"
            age >= 14 -> IO.puts "You can wait"
            true -> IO.puts "Default"
        end

        case 2 do
            1 -> IO.puts "Entered 1"
            2 -> IO.puts "Entered 2"
            _ -> IO.puts "Default"
        end

        IO.puts "Ternary : #{if age > 18, do: "Can vote", else: "Can't vote"}"

        my_stats = {175, 6.25, :Derek}

        IO.puts "Tuple #{is_tuple my_stats}"

        my_stats2 = Tuple.append(my_stats, 42)

        IO.puts "Age #{elem(my_stats2, 3)}"

        IO.puts "Size #{tuple_size(my_stats2)}"

        my_stats3 = Tuple.delete_at my_stats2, 0
        my_stats4 = Tuple.insert_at my_stats3, 0, 1974

        many_zeroes = Tuple.duplicate 0, 5

        {weight, height, name} = {175, 6.25, "Derek"}

        IO.puts "Weigth: #{weight}"
        IO.puts "Heigth: #{height}"
        IO.puts "Name: #{name}"

        list1 = [1, 2, 3]
        list2 = [4, 5, 6]

        list3 = list1 ++ list2
        list4 = list3 -- list1

        IO.puts 6 in list4

        [head | tail] = list3

        IO.inspect list3

        IO.puts "Head : #{head}"
        IO.write "Tail : "
        IO.inspect tail

        IO.inspect [97,98], charlists: :as_lists

        Enum.each tail, fn item ->
            IO.puts item
        end

        words = ["Random", "Words", "in a", "list"]
        Enum.each words, fn word ->
            IO.puts word
        end

        display_list(words)

        IO.puts display_list(List.delete(words, "Random"))
        IO.puts display_list(List.delete_at(words, 1))

        IO.puts List.first words

        IO.puts List.last words

        my_stats = [name: "Derek", height: 6.25]

        capitals = %{
            "Alabama" => "Montgomery",
            "Alaska" => "Juneau",
            "Arizona" => "Phoenix"
        }

        IO.puts "Capital of Alaska is #{capitals["Alaska"]}"

        capitals2 = %{alabama: "Montgomery", alaska: "Juneau", arizona: "Phoenix"}

        IO.puts "Capital of Arizona is #{capitals2.arizona}"

        capitals3 = Dict.put_new(capitals, "Arkansas", "Little Rock")

        [length, width] = [20, 30]

        IO.puts "Width: #{width}"

        [_, [_, a]] = [20, [30, 40]]
        IO.puts "Get num: : #{a}"

        get_sum = fn x, y -> x + y end

        IO.puts "5 + 5 = #{get_sum.(5, 5)}"

        get_less = &(&1 - &2)

        IO.puts "7 - 6 = #{get_less.(7, 6)}"

        add_sum = fn
            {x, y} -> IO.puts "#{x} + #{y} = #{x+y}"
            {x, y, z} -> IO.puts "#{x} + #{y} + #{z} = #{x+y+z}"
        end

        add_sum.({1, 2})
        add_sum.({1, 2, 3})

        IO.puts do_it()

        IO.puts "Factorial of 4 : #{factorial 4}"

        IO.puts "Sum : #{sum([1, 2, 3])}"

        loop(5,1)
    end

    def sum([]), do: 0

    def sum([h|t]), do: h + sum(t)

    def loop(0,_), do: nil

    def loop(max, min) do
        if max < min do
            loop(0, min)
        else
            IO.puts "Num : #{max}"
            loop(max - 1, min)
        end
    end

    def factorial num do
        if num <= 1 do
            1
        else
            num * factorial num - 1
        end
    end

    def display_list([word|words]) do
        IO.puts word
        display_list(words)
    end

    def display_list([]), do: nil

    # Default values
    def do_it(x \\ 1, y \\ 1) do
        x + y
    end
end
