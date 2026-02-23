# Ladder

A game that chooses a random four letter word from a dictionary of valid four letter words as a base, and another as a target.
Let the user make one move at a time, changing one letter from the base word to form a new base word.
The player’s objective is to reach the target word.

This puzzle is called a word ladder.

The object of a word ladder is to change one word into another by altering one letter at a time and making a common, uncapitalized English word at each step. No letters may be scrambled from one step to the next.

For example, to change warm to cold in four steps, you could write.

Can you complete the six animal-related word ladders below in the number of steps indicated?

1. CATS to MICE (4 steps)
2. BULL to BEAR (4 steps)
3. PONY to COLT (5 steps)
4. FROG to TOAD (7 steps)
5. LION to LAMB (7 steps)
6. FAWN to DEER (7 steps)

Answers:

While other routes may be possible, here are our answers:

1. CATS, MATS, MATE, MACE, MICE
2. BULL, BELL, BELT, BEAT, BEAR
3. PONY, POND, BOND, BOLD, BOLT, COLT
4. FROG, FROM, PROM, PRAM, GRAM, GRAD, GOAD, TOAD
5. LION, LIEN, LIES, LIDS, LADS, LADE, LAME, LAMB
6. FAWN, PAWN, PAWS, PEWS, SEWS, SEES, SEER, DEER

Published in [Chicago Tribune](https://www.chicagotribune.com/1993/01/19/this-puzzle-is-called-a-word-ladderthe/).


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ladder` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ladder, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/ladder>.
