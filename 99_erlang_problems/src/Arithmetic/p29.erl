%%%-------------------------------------------------------------------
%%2.01 (**) Determine whether a given integer number is prime.
%%Example:
%%?- is_prime(7).
%%Yes

%%%-------------------------------------------------------------------


-module(p29).
-author("chen_j").

%% API
-export([is_prime/1, is_prime2/1]).


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


%%%%%%======================================


is_prime2(N) when N =< 1 ->
  false;
is_prime2(N) -> is_prime2(N, 2).


is_prime2(N, Count) when Count < N ->
  case N rem Count == 0 of
    true -> false;
    false -> is_prime2(N, Count + 1)
  end;
is_prime2(N, Count) when Count >= N ->
  true.


%%Test:
%%12> c(p29).
%%{ok,p29}
%%13> p29:is_prime(2).
%%true
%%14> p29:is_prime(3).
%%true
%%15> p29:is_prime(5).
%%true
%%16> p29:is_prime(4).
%%false
%%17> p29:is_prime(7).
%%true
%%18> p29:is_prime(78).
%%false
%%19> p29:is_prime(8).
%%false
%%20> p29:is_prime(9).
%%false
%%23> p29:is_prime2(0).
%%false
%%24> p29:is_prime2(1).
%%false
%%25> p29:is_prime2(2).
%%true
%%26> p29:is_prime2(3).
%%true
%%27> p29:is_prime2(4).
%%false
%%28> p29:is_prime2(5).
%%true
%%29> p29:is_prime2(6).
%%false
%%30> p29:is_prime2(7).
%%true
%%31> p29:is_prime2(8).
%%false
%%32> p29:is_prime2(9).
%%false
%%33> p29:is_prime2(10).
%%false
%%34> p29:is_prime2(11).
%%true
%%35> p29:is_prime2(101).
%%true
%%36> p29:is_prime2(10).
%%false
%%37> p29:is_prime2(102).
%%false
%%38> p29:is_prime2(103).
%%true
%%39> p29:is_prime2(105).
%%false
%%40> p29:is_prime2(10678352).
%%false
%%41> p29:is_prime2(10678351).
%%false
%%42> p29:is_prime2(10678353).
%%false
%%43> p29:is_prime2(1067831).
%%true
%%44> p29:is_prime(1067831).
%%true
%%45> p29:is_prime(10678353).
%%false
