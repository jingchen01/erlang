%%%-------------------------------------------------------------------
%%% @author chen_j
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. Oct 2016 12:56 PM

%%7. Add a function split(L) to math_functions.erl, which returns {Even, Odd} where
%%Even is a list of all the even numbers in L and Odd is a list of all the odd
%%numbers in L. Write this function in two different ways using accumulators
%%and using the function filter you wrote in the previous exercise.
%%%-------------------------------------------------------------------
-module(math_functions_4).
-author("chen_j").

%% API
-export([even/1, odd/1, filter/2, split1/1, split2/1]).

even(Number) ->
  % Use `rem` to check if the remainder is 0
  % if it is return true, otherwise false
  0 =:= Number rem 2.

odd(Number) ->
  % Use `rem` to check if the remainder is 1
  % if it is return true, otherwise false
  % (for odd numbers the remainder of
  % division by 2 will always be 1)
  1 =:= Number rem 2.

filter(Fun, List) ->
  % Invoke filter/3, which does the real work
  % then reverse the resulting list, as
  % filter/3 returns a list in reverse order.
  lists:reverse(filter(Fun, List, [])).

filter(_Fun, [], Result) ->
  % If there are no more items in the list
  % return the result
  Result;
filter(Fun, [Item | Remaining], Result) ->
  % If another item still exists in the list
  % Apply `Fun` to it and check the result,
  % if true, add the item to the result.
  case Fun(Item) of
    true ->
      filter(Fun, Remaining, [Item | Result]);
    _ ->
      filter(Fun, Remaining, Result)
  end.

split1(List) ->
  % For the first version of split we use an
  % accumulator. So we defined split/2 to pass
  % along the accumulator to each recursive call
  split(List, {[], []}).

split([], {Even, Odd}) ->
  % The Even and Odd lists were constructed in
  % reverse so we reverse them to correct the
  % order.
  {lists:reverse(Even), lists:reverse(Odd)};
split([Item | List], {Even, Odd}) ->
  % In order to determine what list an item
  % should be added to we pass it to even/1. If
  % it returns true we add it to the Even list,
  % otherwise we add it to the Odd list.
  case ?MODULE:even(Item) of
    true ->
      split(List, {[Item | Even], Odd});
    false ->
      split(List, {Even, [Item | Odd]})
  end.

split2(List) ->
  % In the second version of the split function
  % we simply invoke the filter/2 function and
  % pass in a reference to the even/1 or odd/1
  % functions. The first call returns all the even
  % items and the second returns all the odd items.
  Even = filter(fun even/1, List),
  Odd = filter(fun odd/1, List),
  % Then we simply return both lists
  {Even, Odd}.


%%Result:
%%38> c(math_functions_4).
%%{ok,math_functions_4}
%%39> L.
%%[1,2,5,6,7,8,10,12,16,80,91,96]
%%41> math_functions_4:split1(L).
%%{[2,6,8,10,12,16,80,96],[1,5,7,91]}
%%42> math_functions_4:split2(L).
%%{[2,6,8,10,12,16,80,96],[1,5,7,91]}
%%43>
%%43> F1 = fun(X) -> math_functions_4:even(X) end.
%%#Fun<erl_eval.6.52032458>
%%44> math_functions_4:filter(F1,L).
%%[2,6,8,10,12,16,80,96]
%%45> F2 = fun(X) -> math_functions_4:odd(X) end.
%%#Fun<erl_eval.6.52032458>
%%46> math_functions_4:filter(F2,L).
%%[1,5,7,91]

