%%%-------------------------------------------------------------------
%%% @author chen_j
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. Oct 2016 10:10 PM

%%6. Add a higher-order function to math_functions.erl called filter(F, L), which returns
%%all the elements X in L for which F(X) is true.
%%%-------------------------------------------------------------------
-module(math_functions_3).
-author("chen_j").

%% API
-export([even/1, odd/1, filter/2]).

even(X) -> X rem 2 =:= 0.
odd(X) -> not even(X).

filter(_, []) -> [];
filter(F, L) -> [X || X <- L, F(X)].


%%result:
%%48> c( math_functions_3).
%%{ok,math_functions_3}
%%49> L.
%%[1,2,5,6,7,8,10,12,16,80,91,96]
%%50> Even = fun(X) -> math_functions_3:even(X) end.
%%#Fun<erl_eval.6.52032458>
%%51> math_functions_3:filter(Even, L).
%%[2,6,8,10,12,16,80,96]
%%52>
%%52> Odd = fun(X) -> math_functions_3:odd(X) end.
%%#Fun<erl_eval.6.52032458>
%%53> math_functions_3:filter(Odd, L).
%%[1,5,7,91]
