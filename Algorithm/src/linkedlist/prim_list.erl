-module(prim_list).
-compile(export_all).

new() ->
  [].

% ---------------------------------------------------------------------------------------
% Append the specified Node to the end of the list. (by reversing list each time)
% ---------------------------------------------------------------------------------------
add(Data, List) ->
  lists:reverse([Data | lists:reverse(List)]).

% ---------------------------------------------------------------------------------------
% Append the specified Node to the end of the list. (using ++ operator)
% ---------------------------------------------------------------------------------------
poor_add(Data, List) ->
  List ++ [Data].

% ---------------------------------------------------------------------------------------
% Inserts the given Node at the beginning of this list.
% ---------------------------------------------------------------------------------------
add_first(Data, List) ->
  [Data | List].