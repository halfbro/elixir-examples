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

# Keyword lists:
# - Keys must be atoms
# - Keys have an order
# - Keys can be specified multiple times
keywordList = [a: 1, b: 2]
[{:a, 1}, {:b, 2}] == [a: 1, b: 2]
keywordList = keywordList ++ [c: 3]
keywordList = keywordList ++ [a: 7]
keywordList[:a]

# Keyword lists passed as the last argument to a function
# do not need to include their brackets
String.split("Elixir", "")
String.split("Elixir", "", [trim: true])
String.split("Elixir", "", trim: true)

# Maps:
# - Any value can be a key
# - Keys do not have an order
m = %{:a => 1, 2 => :b}
m[:a]
m[2]
m = %{ m | :a => 3}

# When all keys are atoms, you can use keyword syntax
kv = %{a: 1, b: 2}
kv[:b]
kv.b


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

%{} = m # empty map always matches
%{:a => matched} = m

# 'case' is used to compare a value against many patterns
case {1, 2, 3} do
  {2, 3, 4} -> "Never match"
  {x, 2, 3} when x < 0 -> "Guard means never match"
  {x, 2, 3} -> "Will match, x is #{x}"
  _ -> "Default"
end

# 'cond' is used when conditions are not related (if/elif/else chains)
cond do
  2+2 == 5 -> "Never"
  3*3 == 8 -> "Never"
  0*3 == 0 -> "Yes"
end
