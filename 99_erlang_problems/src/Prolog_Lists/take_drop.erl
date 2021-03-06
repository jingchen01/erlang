
%% file: take_drop.erl
-module(take_drop).
-export([take/2, drop/2]).

%% take first N elements of list
take([], _) -> [];
take([H | T], N) when N > 0 ->
  [H | take(T, N - 1)];
take(_, 0) -> [].

%% drop first N elements of list
drop([], _) -> [];
drop([_ | T], N) when N > 0 ->
  drop(T, N - 1);
drop(Xs, 0) -> Xs.
