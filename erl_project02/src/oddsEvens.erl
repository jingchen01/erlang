%%%-------------------------------------------------------------------
%%% @author chen_j
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. Oct 2016 4:56 PM
%%%-------------------------------------------------------------------
-module(oddsEvens).
-author("chen_j").

%% API
-export([odds_and_evens/1, odds_and_evens_acc/3, odds_and_evens_in_order/1, odds_and_evens_acc_in_order/3]).

odds_and_evens(L) ->
  odds_and_evens_acc(L, [], []). %% odds_and_evens_acc(input_list, odds_list, evens_list)

odds_and_evens_acc([H | T], Odds, Evens) ->
  case (H rem 2) of
    1 -> odds_and_evens_acc(T, [H | Odds], Evens);
    0 -> odds_and_evens_acc(T, Odds, [H | Evens])
  end;

odds_and_evens_acc([], Odds, Evens) ->
  {Odds, Evens}.

%%----------

odds_and_evens_in_order(L) ->
  odds_and_evens_acc_in_order(L, [], []). %% odds_and_evens_acc_in_order(input_list, odds_list, evens_list)

odds_and_evens_acc_in_order([H | T], Odds, Evens) ->
  case (H rem 2) of
    1 -> odds_and_evens_acc_in_order(T, [H | Odds], Evens);
    0 -> odds_and_evens_acc_in_order(T, Odds, [H | Evens])
  end;

odds_and_evens_acc_in_order([], Odds, Evens) ->
  {lists:reverse(Odds), lists:reverse(Evens)}.


%%11> c(oddsEvens).
%%{ok,oddsEvens}
%%12> oddsEvens:odds_and_evens([1,2,3,4,5,6]).
%%{[5,3,1],[6,4,2]}
%%13> oddsEvens:odds_and_evens_in_order([1,2,3,4,5,6]).
%%{[1,3,5],[2,4,6]}


