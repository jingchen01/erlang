%%%-------------------------------------------------------------------
%%% @author chen_j
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. Oct 2016 12:05 PM
%%%-------------------------------------------------------------------
-module(pythagorean_triplets).
-author("chen_j").

%% API
-export([pythag/1]).

pythag(N) ->
  [{A, B, C} ||
    A <- lists:seq(1, N), %% lists:seq(1, N) returns a list of all the integers from 1 to N.
    B <- lists:seq(1, N),
    C <- lists:seq(1, N),
    A + B + C =< N,
    A * A + B * B =:= C * C
  ].


%%result:
%%9> c(pythagorean_triplets).
%%{ok,pythagorean_triplets}
%%10> pythagorean_triplets:pythag(12).
%%[{3,4,5},{4,3,5}]
%%11> pythagorean_triplets:pythag(20).
%%[{3,4,5},{4,3,5}]
%%12> pythagorean_triplets:pythag(22).
%%[{3,4,5},{4,3,5}]
%%13> pythagorean_triplets:pythag(32).
%%[{3,4,5},{4,3,5},{5,12,13},{6,8,10},{8,6,10},{12,5,13}]