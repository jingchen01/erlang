%%%-------------------------------------------------------------------
%%% @author chen_j
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. Oct 2016 10:26 AM
%%%-------------------------------------------------------------------
-module(quickSort).
-author("chen_j").

%% API
-export([qsort/1]).

qsort([]) -> [];
qsort([Pivot | T]) ->
  qsort([X || X <- T, X < Pivot])
  ++ [Pivot] ++
    qsort([X || X <- T, X >= Pivot]).

%% a new list is created that is a copy of the elements in List1, followed by List2:
%% List1 ++ List2


%%result:
%%2> c(quickSort).
%%{ok,quickSort}
%%3> L=[23,6,2,9,27,400,78,45,61,82,14].
%%[23,6,2,9,27,400,78,45,61,82,14]
%%4> quickSort:qsort(L).
%%[2,6,9,14,23,27,45,61,78,82,400]