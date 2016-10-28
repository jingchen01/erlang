%% Module name is the same as file name
-module('Demo04_Accumulators').
-author("chen_j").

%% Specify which of the functions define
%% within the module that are visible outside the module
-export([add/2, factorial/1, factorial/2]).

%% function add
add(X, Y) -> %% Head
  X + Y.   %% Body

%% factorial function, tail recursion
factorial(N) when N > 0 ->
  N * factorial(N - 1);

factorial(0) ->
  1.

%%Factorial function using Accumulators
factorial(N, TotalFact) when N > 0 ->
  factorial(N - 1, N * TotalFact);
factorial(0, TotalFact) ->
  TotalFact.


