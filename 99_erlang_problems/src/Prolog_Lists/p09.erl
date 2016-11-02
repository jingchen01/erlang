%%%-------------------------------------------------------------------
%%1.09 (**) Pack consecutive duplicates of list elements into sublists.
%%If a list contains repeated elements they should be placed in separate sublists.
%%
%%Example:
%%pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
%%Result: [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]

%%%-------------------------------------------------------------------
-module(p09).
-export([pack/1, pack2/1, pack3/1]).
-import(lists, [takewhile/2, dropwhile/2]).

pack([]) -> [];

pack([H | T]) ->
  P1 = takewhile(fun(X) -> X == H end, [H | T]),
  P2 = dropwhile(fun(X) -> X == H end, [H | T]),
  [P1 | pack(P2)].


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


pack2([], []) ->
  [];
pack2([], [H | T]) ->
  pack2([H], T);
pack2([H | _] = L, [H | T]) ->
  pack2([H | L], T);
pack2(L, List) ->
  [L | pack2([], List)].

pack2(List) ->
  pack2([], List).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pack3([]) ->
  [];
pack3([H | []]) ->
  [[H]];
pack3([H, H | C]) ->
  [Head | Tail] = pack3([H | C]),
  X = lists:append([H], Head),
  [X | Tail];
pack3([H, H2 | C]) ->
  if H =/= H2 ->
    [[H] | pack3([H2 | C])]
  end.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%Test:
%%18> c(p09).
%%{ok,p09}
%%19> p09:pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
%%[[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]
%%20> p09:pack2([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
%%[[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]
%%21>  p09:pack3([a,a,a,a,b,c,c,a,a,d,e,e,e,e]).
%%[[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]

