%%%-------------------------------------------------------------------
%%% @author chen_j
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. Oct 2016 10:00 PM

%%5. Write a module called math_functions.erl, exporting the functions even/1 and
%%odd/1. The function even(X) should return true if X is an even integer and
%%otherwise false. odd(X) should return true if X is an odd integer.
%%%-------------------------------------------------------------------
-module(math_functions).
-author("chen_j").

%% API
-export([even/1, odd/1]).

even(X) ->
  0 =:= X rem 2.

odd(X) ->
  1 =:= X rem 2.

%%result:
%%55> math_functions:odd(5).
%%true
%%56> math_functions:odd(4).
%%false
%%57> math_functions:even(4).
%%true
%%58> math_functions:even(6).
%%true
%%59> math_functions:even(5).
%%false
