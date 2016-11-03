%%%-------------------------------------------------------------------
%%1.22 (*) Create a list containing all integers within a given range.
%%Example:
%%range(4,9).
%%Result: [4,5,6,7,8,9]
%%%-------------------------------------------------------------------
-module(p22).
-author("chen_j").

%% API
-export([range/2]).

range(Start, End) ->
  lists:seq(Start, End).


%%Test:
%%99> c(p22).
%%{ok,p22}
%%100> p22:range(4,9).
%%[4,5,6,7,8,9]
%%101> p22:range(5,12).
%%[5,6,7,8,9,10,11,12]
