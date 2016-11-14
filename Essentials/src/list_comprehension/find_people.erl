%%%-------------------------------------------------------------------
%%“Presume you have this list of people’s names, genders, and ages:
%%People = [{"Federico", $M, 22}, {"Kim", $F, 45}, {"Hansa", $F, 30},
%%{"Tran", $M, 47}, {"Cathy", $F, 32}, {"Elias", $M, 50}].”
%%%-------------------------------------------------------------------
-module(find_people).
-author("jingchen").

%% API
-export([find/1]).

%%%---------------------------------------%%%
%%“Part One
%%In erl (or in a module, if you prefer),
%%write a list comprehension that creates a list consisting of the names of all males who are over 40.
%%Use pattern matching to separate the tuple into three variables,
%%and two guards to do the tests for age and gender.”

%%%---------------------------------------%%%


find([]) ->
  [];

find(L) ->
  find(L, []).

find(L, Result) ->
  if
    is_list(L) ->
      [H | T] = L,
      {Name, Gender, Age} = H,
      Gender  when  $M ->

  ;
    true -> []
  end

