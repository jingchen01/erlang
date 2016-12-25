-module(spec_linkedlist).
-compile(export_all).

main(N) ->
  io:format("---- # of Nodes = ~p ----~n", [N]),
  display("Add Node at the beg", timer:tc(spec_linkedlist, test_add_first, [N])),
  display("Add Node to the end", timer:tc(spec_linkedlist, test_add_last, [N])),
  ok.

display(Description, {Time, ok}) ->
  io:format("~p: Time = [~p] microseconds~n", [Description, Time]).

% ---------------------------------------------------------------------------------------
% Test function to Append N Nodes to the end of the list
% ---------------------------------------------------------------------------------------
test_add_last(N) ->
  List = linkedlist:new(),
  add_last_for(1, N, List),
  ok.

add_last_for(N, N, List) -> linkedlist:add(N, List);
add_last_for(I, N, List) -> add_last_for(I + 1, N, linkedlist:add(I, List)).

% ---------------------------------------------------------------------------------------
% Test function to Append N Nodes at the begining of the list
% ---------------------------------------------------------------------------------------
test_add_first(N) ->
  List = linkedlist:new(),
  add_first_for(1, N, List),
  ok.

add_first_for(N, N, List) -> linkedlist:add_first(N, List);
add_first_for(I, N, List) -> add_first_for(I + 1, N, linkedlist:add_first(I, List)).