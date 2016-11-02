%%%-------------------------------------------------------------------
%%1.07 (**) Flatten a nested list structure.
%%Transform a list, possibly holding lists as elements into a 'flat' list by replacing each list with its elements (recursively).
%%
%%Example:
%%my_flatten([a, [b, [c, d], e]]).
%%
%%Return: [a, b, c, d, e]
%%
%%Hint: Use the predefined predicates is_list/1 and append/2
%%%-------------------------------------------------------------------

-module(p07).
-author("chen_j").

%% API
-export([my_flatten/1, my_flatten2/1]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

my_flatten(L) ->
  lists:flatten(L).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

my_flatten2([H | T]) ->
  if
    is_list(H) ->
      lists:append(my_flatten2(H), my_flatten2(T));
  %%lists:append(A, B) is equivalent to A ++ B.
    true ->
      [H | my_flatten2(T)]
  end;
my_flatten2([]) -> [].

%%Test:
%%9> c(p07).
%%{ok,p07}
%%10> p07:my_flatten2([a, [b, [c, d], e]]).
%%[a,b,c,d,e]
%%11> p07:my_flatten2([]).
%%[]
%%12> p07:my_flatten([]).
%%[]
%%13> p07:my_flatten2([a, [b, c, d, e]]).
%%[a,b,c,d,e]
%%14> p07:my_flatten([a, [b, c, d, e]]).
%%[a,b,c,d,e]
%%15> p07:my_flatten([a]).
%%[a]
%%16> p07:my_flatten2([a]).
%%[a]

