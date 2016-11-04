%%%-------------------------------------------------------------------
%%1.28 (**) Sorting a list of lists according to length of sublists
%%
%%a) We suppose that a list (InList) contains elements that are lists themselves.
%%The objective is to sort the elements of InList according to their length.
%%E.g. short lists first, longer lists later, or vice versa.
%%
%%Example:
%% lsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]]).
%% Result: [[o], [d, e], [d, e], [m, n], [a, b, c], [f, g, h], [i, j, k, l]]
%%
%%b) Again, we suppose that a list (InList) contains elements that are lists themselves.
%%But this time the objective is to sort the elements of InList according to their length frequency;
%%i.e. in the default, where sorting is done ascendingly, lists with rare lengths are placed first,
%%others with a more frequent length come later.
%%
%%Example:
%% lfsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]]).
%%Result: [[i, j, k, l], [o], [a, b, c], [f, g, h], [d, e], [d, e], [m, n]]
%%
%%Note that in the above example, the first two lists in the result L have length 4 and 1,
%%both lengths appear just once.
%%The third and forth list have length 3; there are two list of this length.
%%And finally, the last three lists have length 2.
%%This is the most frequent length.
%%%-------------------------------------------------------------------
-module(p28).
-author("chen_j").

%% API
-export([lsort/1]).


merge([], [], _Key) ->
  [];
merge([], L2, _Key) ->
  L2;
merge(L1, [], _Key) ->
  L1;
merge([H1 | T1] = L1, [H2 | T2] = L2, Key) ->
  case Key(H1) =< Key(H2) of
    true ->
      [H1 | merge(T1, L2, Key)];
    false ->
      [H2 | merge(L1, T2, Key)]
  end.

mergebypair([], _Key) ->
  [];
mergebypair([L], _Key) ->
  [L];
mergebypair([H1, H2 | L], Key) ->
  [merge(H1, H2, Key) | mergebypair(L, Key)].


mergelists([], _Key) ->
  [];
mergelists([L], _Key) ->
  L;
mergelists(Lists, Key) ->
  mergelists(mergebypair(Lists, Key), Key).

mergesort(List, Key) ->
  mergelists([[E] || E <- List], Key).


lsort(List) ->
  mergesort(List, fun my_length/1).

