(*
['t']
['t', 'o', 'f']
['f']
['f', 'or', 't', 'and', 'f']


['B'] ->
['B', 'and', 'B'] ->
['B', 'and', 'B', 'and', 'B'] ->
['B', 'and', 'B', 'and', 'B', 'and', 'B'] ->
['L', 'and', 'B', 'and', 'B', 'and', 'B'] ->
['t', 'and', 'B', 'and', 'B', 'and', 'B'] ->
['t', 'and', 'L', 'and', 'B', 'and', 'B'] ->
['t', 'and', 'f', 'and', 'B', 'and', 'B'] ->
['t', 'and', 'f', 'and', 'L', 'and', 'B'] ->
['t', 'and', 'f', 'and', 'L', 'and', 'B', 'or', 'B'] ->
['t', 'and', 'f', 'and', 'L', 'and', 'B', 'or', 'L'] ->
['t', 'and', 'f', 'and', 't', 'and', 'B', 'or', 'L'] ->
['t', 'and', 'f', 'and', 't', 'and', 'L', 'or', 'L'] ->
['t', 'and', 'f', 'and', 't', 'and', 't', 'or', 'L'] ->
['t', 'and', 'f', 'and', 't', 'and', 't', 'or', 'f']

C ->(1)
{C} ->(1)
{{C}} -> (3)
{{}}


{{}}

----------





1. S -> 1A1
2. A -> 0A
3. A -> []

S ->(1)
1A1 ->(2)
10A1 ->(2)
100A1 ->(2)
1000A1 -> (3)
10001

S ->(1)
1A1 ->(3)
11


1. C -> 1D
2. D -> 0D
3. D -> E
4. E -> 1

11

C ->(1)
1D ->(3)
1E ->(4)
11


10001

C ->(1)
1D ->(2)
10D ->(2)
100D ->(2)
1000D ->(3)
1000E ->(4)
10001



------
1. S -> 0 S 1
2. S -> []

S ->(1)
1 S 0 ->(1)
1 1 S 0 0 ->(2)
1 1 0 0

-----
1. S -> 0 S 1
2. S -> A
3. A -> []
4. A -> 1 A

({S, A}, {0, 1}, {
  S -> 0 S 1
  S -> A
  A -> []
  A -> 1 A
}, S)

*)


0 0 1 1 1

S ->(1)
0 S 1 ->(1)
0 0 S 1 1 ->(2)
0 0 A 1 1 ->(4)
0 0 1 A 1 1 ->(3)
0 0 1 1 1

--------
E ->(2)
E / E ->(1)
E x E / E ->(3)
L x E / E ->(6)
8 x E / E ->(3)
8 x L / E ->(4)
8 x 2 / E ->(3)
8 x 2 / L ->(5)
8 x 2 / 4















;