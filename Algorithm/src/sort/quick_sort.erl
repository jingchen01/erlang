%%%-------------------------------------------------------------------
%%% Quick Sort

%%The expression [X || X <- T, X < Pivot] is the list of all elements in T that are less than Pivot.
%%
%%[X || X <- T, X >= Pivot] is the list of all elements in T that are greater than or equal to Pivot.
%%
%%A list sorted as follows:
%%
%%The first element in the list is isolated and the list is split into two sublists.
%%The first sublist contains all elements that are smaller than the first element in the list.
%%The second sublist contains all elements that are greater than, or equal to, the first element in the list.
%%Then the sublists are sorted and the results are combined.

%%%-------------------------------------------------------------------

-module(quick_sort).
-export([sort/1]).

sort([Pivot | T]) ->
  sort([X || X <- T, X < Pivot]) ++
    [Pivot] ++
    sort([X || X <- T, X >= Pivot]);
sort([]) -> [].


%%Test:
%%quick_sort:sort([8,5,1,8,0,10,31,5,6,1,-6,91,11,20,3]).
%%[-6,0,1,1,3,5,5,6,8,8,10,11,20,31,91]
