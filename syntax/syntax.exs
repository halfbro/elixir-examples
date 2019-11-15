# Basic Elxir syntax

# Basic types

x = 1
y = 1.0
s1 = "Hellö"
s2 = "As a string: #{x}"

5 = String.length(s1)
6 = byte_size(s1)

true == true

res = :ok
err = :error
:atom1 == :atom2
true == :true

add3 = fn x -> x + 3 end
8 == add3.(5)

1 == 1.0
1 === 1.0

# Use || and && for short circuiting of actual data
unsetValue = nil
output = unsetValue || "default"

longComputation = :ok
output = nil && longComputation

# Use 'and' and 'or' when you are expecting booleans
true and true
err = 2 and true

# You can compare different types in Elixir! The ordering goes as such:
# number < atom < reference < function < port < pid < tuple < map < list < bitstring
1 < :anyatom

# Complex types

l = [1, 2, true, :apple, :orange]
5 == length l

l1 = [1, 2, 3] ++ [4, 5, 6]
l2 = [1, true, 2, false, 3, true] -- [true, false]
l3 = [1, true, 2, false, 3, true] -- [true, false, false]

xs = [1, 2, 3]
h = hd(xs)

hello = [104, 101, 108, 108, 111]

tuple = {"Car", :engine, 100}


# Strings

greeting = "hello" <> " " <> "world"

'hello' == "hello"

<<104, 101, 108, 108, 111, 0>> == "hello" <> <<0>>

<<0>> == <<256>>
<<1, 0>> == <<256 :: size(16)>>

"Ā" == <<256 :: utf8>>
<<196, 128, 0>> == <<256 :: utf8, 0>>

<<0>> == <<2 :: size(1)>>
<<0 :: size(1)>> == <<2 :: size(1)>>

'hello' == [104, 101, 108, 108, 111]

"hello" == to_string 'hello'
'hello' == to_charlist "hello"


# Pattern Matching

# The "equals" sign is known as the match operator(!)
# It's really either:
# - binding a symbol on the left to a value on the right
# - enforcing that a value on the left matches a value on the right

xs = [1, 2, 3]
h = 1

# Use pin operator ^ to match against the existing value of h instead of binding to h
  [^h | ys] = xs

{:ok, result} = {:ok, 42}
{:ok, result} = {:err, "Error!"}

[head | tail] = [1, 2, 3]
[1 | tail]

