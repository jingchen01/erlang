%%%-------------------------------------------------------------------
%%1.08 (**) Eliminate consecutive duplicates of list elements.
%%If a list contains repeated elements they should be replaced with a single copy of the element.
%% The order of the elements should not be changed.
%%
%%Example:
%%compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
%%Result: [a,b,c,a,d,e]
%%%-------------------------------------------------------------------

-module(p08).
-author("chen_j").

%% API
-export([compress/1, compress2/1, compress3/1]).


compress(L) ->
  lists:reverse(lists:foldl(fun compress/2, [], L)).
compress(H, [H | T]) ->
  [H | T];
compress(H, L) ->
  [H | L].


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


compress2(_, []) ->
  [];
compress2(H, [H | T]) ->
  compress2(H, T);
compress2(_, [H | T]) ->
  [H | compress2(H, T)].

compress2(List) ->
  compress2([], List).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


compress3(List) ->
  case List of
    [] -> [];
    [Head | []] -> [Head];
    [Head, Second | []] ->
      if
        Head == Second -> [Head];
        Head /= Second -> [Head, Second]
      end;
    [Head, Second | Tail] ->
      if
        Head == Second -> compress3([Second | Tail]);
        Head /= Second -> [Head | compress3([Second | Tail])]
      end
  end.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%Test:
%%4> c(p08).
%%{ok,p08}
%%5> p08:compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
%%[a,b,c,a,d,e]
%%6>  p08:compress2([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
%%[a,b,c,a,d,e]
%%7> p08:compress3([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
%%[a,b,c,a,d,e]
%%8> p08:compress([e,e,e,e]).
%%[e]
%%9> p08:compress2([e,e,e,e]).
%%[e]
%%10> p08:compress3([e,e,e,e]).
%%[e]
%%11> p08:compress([]).
%%[]
%%12> p08:compress2([]).
%%[]
%%13> p08:compress3([]).
%%[]

