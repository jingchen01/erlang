%%%-------------------------------------------------------------------
%%Iteration through Lists (More Practice)
%%Add two more functions to the stats module:
%%maximum/1, which is just the same as minimum/1,
%%but don’t forget—as I did—to reverse the direction of your test for “smaller” to become a test for “larger.”
%%(This function also already exists as lists:max/1.)
%%range/1, which takes a list of numbers as its argument and returns a list of two numbers:
%%the minimum and maximum entries in the list.”

%%%-------------------------------------------------------------------
-module(get_range).
-export([range/1]).

%% @doc Returns the minimum item in a list of numbers. Fails when given
%% an empty list, as there's nothing reasonable to return.

%%%%%%======================================

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

%%%%%%======================================

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

%%%%%%======================================

%%range/1
-spec(range([number()]) -> [number()]).

range(L) ->
  if
    length(L) =:= 0 -> "Please input non empty list.";
    length(L) =:= 1 -> L;
    true ->
      [minimum(L), maximum(L)]
  end.


%%Test:
%%1> c(stats).
%%{ok,stats}c(get_range).
%%{ok,get_range}
%%2> N = [4, 1, 7, -17, 8, 2, 5].
%%[4,1,7,-17,8,2,5]
%%3>get_range:range(N1).
%%[-17,8]
