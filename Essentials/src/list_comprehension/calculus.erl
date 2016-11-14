%%%-------------------------------------------------------------------
%%You can calculate the rate of change of a function by calculating: (F(X + Delta) - F(X)) / Delta,
%%where Delta is the interval between measurements.
%%As Delta approaches zero, you get closer and closer to the true value of the derivative.
%%
%%%-------------------------------------------------------------------

-module(calculus).
-export([derivative/2]).

%% @doc Calculate derivative by classical definition.
%% (Fn(X + H) - Fn(X)) / H

-spec(derivative(function(), float()) -> float()).

derivative(Fn, X) ->
  Delta = 1.0e-10,
  (Fn(X + Delta) - Fn(X)) / Delta.


%%Test
%%calculus:derivative(fun(X) -> X * 5 end, 9).
%%5.000018177270249
%%calculus:derivative(fun(X) -> 3 * X * X + 2 * X + 1 end, 5).
%%32.00000264769187
