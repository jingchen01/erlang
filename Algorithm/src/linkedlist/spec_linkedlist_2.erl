-module(spec_linkedlist_2).
-compile(export_all).

main(N) ->
  io:format("---- # of Nodes = ~p ----~n", [N]),
  display("Add Node at the beg                               ", timer:tc(spec_primlist, test_add_first, [N])),
  display("Add Node to the end (reverse once)                ", timer:tc(spec_primlist, test_add_rev_once, [N])),
  display("Add Node to the end (reverse each time)           ", timer:tc(spec_primlist, test_add_rev, [N])),
  display("Add Node to the end (poor implemantation using ++)", timer:tc(spec_primlist, test_poor_add, [N])),
  ok.

display(Description, {Time, ok}) ->
  io:format("~p: Time = [~p] microseconds~n", [Description, Time]).

% ---------------------------------------------------------------------------------------
% Test function for Append N Nodes to the end of the list.
%  (reverse each time)
% ---------------------------------------------------------------------------------------
test_add_rev(N) ->
  List = prim_list:new(),
  add_rev_for(1, N, List),
  ok.

add_rev_for(N, N, List) -> prim_list:add(N, List);
add_rev_for(I, N, List) -> add_rev_for(I + 1, N, prim_list:add(I, List)).

% ---------------------------------------------------------------------------------------
% Test function for Append N Nodes to the end of the list.
%  (poor implementation using ++)
% ---------------------------------------------------------------------------------------
test_poor_add(N) ->
  List = prim_list:new(),
  poor_add_for(1, N, List),
  ok.

poor_add_for(N, N, List) -> prim_list:poor_add(N, List);
poor_add_for(I, N, List) -> poor_add_for(I + 1, N, prim_list:poor_add(I, List)).

% ---------------------------------------------------------------------------------------
% Test function for Append N Nodes to the end of the list.
%  (reverse at the end of adding Nodes process)
% ---------------------------------------------------------------------------------------
test_add_rev_once(N) ->
  List = prim_list:new(),
  lists:reverse(add_first_for(1, N, List)),
  ok.

% ---------------------------------------------------------------------------------------
% Test function for Append N Nodes at the begining of the list.
% ---------------------------------------------------------------------------------------
test_add_first(N) ->
  List = prim_list:new(),
  add_first_for(1, N, List),
  ok.

add_first_for(N, N, List) -> prim_list:add_first(N, List);
add_first_for(I, N, List) -> add_first_for(I + 1, N, prim_list:add_first(I, List)).