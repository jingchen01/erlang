%%%-------------------------------------------------------------------
%%calculate square of each element of list
%%%-------------------------------------------------------------------
-module(square_of_list).
-author("chen_j").

%% API
-export([square_list/1]).

square_list([]) ->
  [];
square_list([H | T]) ->
  square_list([H | T], []).

square_list([], Result) ->
  lists:reverse(Result);
square_list([H | T], Result) ->
  square_list(T, [H * H | Result]).


%%Test:
%%2> c(square_of_list).
%%{ok,square_of_list}
%%3> square_of_list:square_list([9, 4.22, 5]).
%%[81,17.8084,25]