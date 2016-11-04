%%%-------------------------------------------------------------------
%%2.02 (**) Determine the prime factors of a given positive integer.
%%Construct a flat list containing the prime factors in ascending order.
%%Example:
%% prime_factors(315).
%%Result: [3,3,5,7]

%% What you do in this method is you start with the first
%% prime, which is 2 and ask yourself whether the number is divisible
%% by it. If it is, use short division to divide it by 2, and then
%% continue with the answer you get from the division and ask yourself
%% if that is still divisible by 2. If it is, divide that by
%% 2. Eventually you will get an answer that is not divisible by 2, so
%% then you ask yourself whether it is divisible by 3, and then
%% continue on in this way with 5, 7, and the rest of the primes until
%% you get an answer that is prime. Then the numbers along the side
%% and the final answer will be the prime factorization written in the
%% proper order. Here is how we would factor 60 using this method.
%%  60 = 2 * 2 * 3 * 5

%%%-------------------------------------------------------------------
-module(p30).
-author("chen_j").

%% API
-export([prime_factors/1]).


%%prime_factors
prime_factors(N) ->
  if
    N =< 2 -> 0;
    true ->
      P = list_of_prime(2, N),
      prime_factors(N, N, P, [])
  end.

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
%%16> p30:prime_factors(315).
%%[3,3,5,7]
