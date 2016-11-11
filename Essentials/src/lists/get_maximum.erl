%%%-------------------------------------------------------------------
%%Recursive Iteration through a List
%%In a module named stats, write a function named maximum/1.
%%It takes a list of numbers as its argument and returns the biggest value.
%%This function already exists in the lists module (lists:max/1),
%%but it’s a good exercise in learning about recursion.”

%%%-------------------------------------------------------------------
-module(get_maximum).
-export([maximum/1]).

%% @doc Returns the maximum item in a list of numbers. Fails when given
%% an empty list, as there's nothing reasonable to return.

-spec(maximum(list(number())) -> number()).


%%maximum/1
maximum([]) ->
  "Please input non empty list.";
maximum([H]) ->
  H;
maximum([H | T]) ->
  maximum(T, H).

%%maximum/2
maximum([], Result) ->
  Result;
maximum([H | T], Result) ->
  if
    H > Result -> maximum(T, H);
    true -> maximum(T, Result)
  end.


%%Test:
%%11> c(get_maximum).
%%{ok,get_maximum}
%%12> N = [4, 1, 7, -17, 8, 2, 5].
%%[4,1,7,-17,8,2,5]
%%15> get_maximum:maximum(N).
%%8

