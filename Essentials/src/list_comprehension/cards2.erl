%%%-------------------------------------------------------------------
%%“Back to list comprehensions.
%%You can have more than one generator in a list comprehension.
%%Try this in erl:
%%1> [X * Y || X <- [3, 5, 7], Y <- [2, 4, 6]].
%%[6,12,18,10,20,30,14,28,42]
%%Using what you’ve learned from this example, write a module named cards that contains a function make_deck/0.
%%The function will generate a deck of cards as a list 52 tuples in this form:
%%[{"A","Clubs"},
%%{"A","Diamonds"},
%%{"A","Hearts"},
%%{"A","Spades"},
%%{2,"Clubs"},
%%{2,"Diamonds"},
%%{2,"Hearts"},
%%{2,"Spades"},
%%...
%%{"K", "Clubs"},
%%{"K", "Diamonds"},
%%{"K", "Hearts"},
%%{"K", "Spades"}]”

%%%-------------------------------------------------------------------
-module(cards2).
-author("jingchen").

%% API
-export([make_deck/0, show_deck/1, shuffle/1]).

%% @doc generate a deck of cards
make_deck() ->
  [{Value, Suit} || Value <- ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"],
    Suit <- ["Clubs", "Diamonds", "Hearts", "Spades"]].

show_deck(Deck) ->
  lists:foreach(fun(Item) -> io:format("~p~n", [Item]) end, Deck).


shuffle(List) -> shuffle(List, []).
shuffle(List, Acc) ->
  {Leading, [H | T]} = lists:split(rand:uniform(length(List)) - 1, List),
  shuffle(Leading ++ T, [H | Acc]).


