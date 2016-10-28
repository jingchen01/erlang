%% Module name is the same as file name
-module('Demo02').
-author("chen_j").

%% Specify which of the functions define
%% within the module that are visible outside the module
-export([add/2, factorial/1, area/2, area/3]).

%% function add
add(X, Y) -> %% Head
  X + Y.   %% Body

%% factorial function, tail recursion
factorial(N) when N > 0 ->
  N * factorial(N - 1);

factorial(0) ->
  1.

area(Type, N) ->
  case Type of
    square -> N * N;
    circle -> math:pi() * N * N;
    equilateral_triangle -> 0.5 * N * N
  end.

area(Type, L, W) ->
  case Type of
    rectangle -> L * W;
    triangle -> 0.5 * L * W
  end.