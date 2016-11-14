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
-module(cards).
-author("jingchen").

%% API
-export([make_deck/0, show_deck/1]).

%% @doc generate a deck of cards
make_deck() ->
  [{Value, Suit} || Value <- ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"],
    Suit <- ["Clubs", "Diamonds", "Hearts", "Spades"]].

show_deck(Deck) ->
  lists:foreach(fun(Item) -> io:format("~p~n", [Item]) end, Deck).


%%Test:
%%8> L = cards:make_deck().
%%[{"A","Clubs"},
%%{"A","Diamonds"},
%%{"A","Hearts"},
%%{"A","Spades"},
%%{2,"Clubs"},
%%{2,"Diamonds"},
%%{2,"Hearts"},
%%{2,"Spades"},
%%{3,"Clubs"},
%%{3,"Diamonds"},
%%{3,"Hearts"},
%%{3,"Spades"},
%%{4,"Clubs"},
%%{4,"Diamonds"},
%%{4,"Hearts"},
%%{4,"Spades"},
%%{5,"Clubs"},
%%{5,"Diamonds"},
%%{5,"Hearts"},
%%{5,"Spades"},
%%{6,"Clubs"},
%%{6,"Diamonds"},
%%{6,"Hearts"},
%%{6,"Spades"},
%%{7,"Clubs"},
%%{7,"Diamonds"},
%%{7,[...]},
%%{7,...},
%%{...}|...]

%%9> cards:show_deck(L).
%%{"A","Clubs"}
%%{"A","Diamonds"}
%%{"A","Hearts"}
%%{"A","Spades"}
%%{2,"Clubs"}
%%{2,"Diamonds"}
%%{2,"Hearts"}
%%{2,"Spades"}
%%{3,"Clubs"}
%%{3,"Diamonds"}
%%{3,"Hearts"}
%%{3,"Spades"}
%%{4,"Clubs"}
%%{4,"Diamonds"}
%%{4,"Hearts"}
%%{4,"Spades"}
%%{5,"Clubs"}
%%{5,"Diamonds"}
%%{5,"Hearts"}
%%{5,"Spades"}
%%{6,"Clubs"}
%%{6,"Diamonds"}
%%{6,"Hearts"}
%%{6,"Spades"}
%%{7,"Clubs"}
%%{7,"Diamonds"}
%%{7,"Hearts"}
%%{7,"Spades"}
%%{8,"Clubs"}
%%{8,"Diamonds"}
%%{8,"Hearts"}
%%{8,"Spades"}
%%{9,"Clubs"}
%%{9,"Diamonds"}
%%{9,"Hearts"}
%%{9,"Spades"}
%%{10,"Clubs"}
%%{10,"Diamonds"}
%%{10,"Hearts"}
%%{10,"Spades"}
%%{"J","Clubs"}
%%{"J","Diamonds"}
%%{"J","Hearts"}
%%{"J","Spades"}
%%{"Q","Clubs"}
%%{"Q","Diamonds"}
%%{"Q","Hearts"}
%%{"Q","Spades"}
%%{"K","Clubs"}
%%{"K","Diamonds"}
%%{"K","Hearts"}
%%{"K","Spades"}

