%%%-------------------------------------------------------------------
%%2.07 (**) Determine the greatest common divisor of two positive integer numbers.
%%Use Euclid's algorithm.
%%Example:
%%?- gcd(36, 63).
%%Result: 9
%%
%%Define gcd as an arithmetic function; so you can use it like this:
%%?- G is gcd(36,63).
%%Result: 9
%%%-------------------------------------------------------------------
-module(p35).
-author("chen_j").

%% API
-export([gcd/2]).


gcd(A, 0) ->
  abs(A);

gcd(0, B) ->
  abs(B);

gcd(A, B) ->
  gcd(B, A rem B).


%%Test:
%%26> c(p35).
%%{ok,p35}
%%27> p35:gcd(35, 42).
%%7
%%28> p35:gcd(35, 45).
%%5
%%29> p35:gcd(35, 51).
%%1
%%30> p35:gcd(35, 52).
%%1
%%31> p35:gcd(35, 54).
%%1
%%32> p35:gcd(35, 55).
%%5
%%33> p35:gcd(35, 56).
%%7
%%34> p35:gcd(36,63).
%%9


