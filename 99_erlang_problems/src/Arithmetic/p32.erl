%%%-------------------------------------------------------------------
%%2.04 (*) A list of prime numbers.
%%Given a range of integers by its lower and upper limit, construct a list of all prime numbers in that range.

%%%-------------------------------------------------------------------
-module(p32).
-author("chen_j").

%% API
-export([list_of_prime/2]).


%%list_of_prime
list_of_prime(A, B) ->
  [X || X <- lists:seq(A, B), is_prime(X)].


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
%%{ok,p32}
%%45> p32:list_of_prime(1,100).
%%[2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,
%%79,83,89,97]
%%46> p32:list_of_prime(1,10).
%%[2,3,5,7]
%%52>  p32:list_of_prime(1,20).
%%[2,3,5,7,11,13,17,19]
%%53>  p32:list_of_prime(1,200).
%%[2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,
%%79,83,89,97,101,103,107,109|...]