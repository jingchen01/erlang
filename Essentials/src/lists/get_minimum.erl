%%%-------------------------------------------------------------------
%%Recursive Iteration through a List
%%In a module named stats, write a function named minimum/1.
%%It takes a list of numbers as its argument and returns the smallest value.
%%This function already exists in the lists module (lists:min/1),
%%but it’s a good exercise in learning about recursion.”

%%%-------------------------------------------------------------------
-module(get_minimum).
-export([minimum/1]).

%% @doc Returns the minimum item in a list of numbers. Fails when given
%% an empty list, as there's nothing reasonable to return.

-spec(minimum(list(number())) -> number()).


%%minimum/1
minimum([]) ->
  "Please input non empty list.";
minimum([H]) ->
  H;
minimum([H | T]) ->
  minimum(T, H).

%%minimum/2
minimum([], Result) ->
  Result;
minimum([H | T], Result) ->
  if
    H < Result -> minimum(T, H);
    true -> minimum(T, Result)
  end.


%%Test:
%%11> c(get_minimum).
%%{ok,get_minimum}
%%12> N = [4, 1, 7, -17, 8, 2, 5].
%%[4,1,7,-17,8,2,5]
%%13> get_minimum:minimum(N).
%%-17
