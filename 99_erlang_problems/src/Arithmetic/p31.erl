%%%-------------------------------------------------------------------
%%2.03 (**) Determine the prime factors of a given positive integer (2).
%%Construct a list containing the prime factors and their multiplicity.
%%Example:
%% prime_factors_mult(315).
%%Result: [[3,2],[5,1],[7,1]]
%%
%%Hint: The solution of problem 1.10 may be helpful.

%%%-------------------------------------------------------------------
-module(p31).
-author("chen_j").

%% API
-export([prime_factors_mult/1]).

%%prime_factors_mult
prime_factors_mult(N) ->
  [H | T] = prime_factors(N),
  prime_factors_mult(H, T, 1, []).

prime_factors_mult(H, [], 1, []) ->
  [[H, 1]];
prime_factors_mult(H, [H1 | []], TempAcc, Acc) when H == H1 ->
  lists:reverse([[H, TempAcc + 1] | Acc]);
prime_factors_mult(H, [H1 | []], TempAcc, Acc) ->
  lists:reverse([[H1, 1] | [[H, TempAcc] | Acc]]);

prime_factors_mult(H, [H1 | T1], TempAcc, Acc) when H == H1 ->
  prime_factors_mult(H, T1, TempAcc + 1, Acc);
prime_factors_mult(H, [H1 | T1], TempAcc, Acc) ->
  prime_factors_mult(H1, T1, 1, [[H, TempAcc] | Acc]).


%%prime_factors
prime_factors(N) when N =< 2 ->
  0;
prime_factors(N) when N > 2 ->
  P = list_of_prime(2, N),
  prime_factors(N, N, P, []).

prime_factors(_N, _Next, [], Acc) ->
  Acc;
prime_factors(N, Next, [H | T], Acc) ->
  case lists:foldl(fun(X, Prod) -> X * Prod end, 1, Acc) == N of
    true ->
      lists:reverse(Acc);
    false ->
      case Next rem H == 0 of
        true ->
          prime_factors(N, Next div H, [H | T], [H | Acc]);
        false ->
          prime_factors(N, Next, T, Acc)
      end
  end.


%%list_of_prime
list_of_prime(A, B) ->
  [X || X <- lists:seq(A, B), is_prime(X) == true].


%%is_prime
is_prime(N) ->
  if
    N == 2 -> true;
    N < 2 orelse N rem 2 == 0 -> false;
    true -> is_prime(N, 3)
  end.

is_prime(N, K) ->
  if
    K * K > N -> true;
    N rem K == 0 -> false;
    true -> is_prime(N, K + 2)
  end.


%%Test:
%%48> c(p31).
%%{ok,p31}
%%49> p31:prime_factors_mult(315).
%%[[3,2],[5,1],[7,1]]
