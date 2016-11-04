%%%-------------------------------------------------------------------
%%2.08 (*) Determine whether two positive integer numbers are coprime.
%%Two numbers are coprime if their greatest common divisor equals 1.
%%Example:
%%?- coprime(35, 64).
%%Yes
%%%-------------------------------------------------------------------
-module(p36).
-author("chen_j").

%% API
-export([coprime/2]).

%% coprime
coprime(A, B) ->
  gcd(A, B) =:= 1.


%% gcd
gcd(A, 0) ->
  abs(A);

gcd(0, B) ->
  abs(B);

gcd(A, B) ->
  gcd(B, A rem B).


%%Test:
%%36> c(p36).
%%{ok,p36}
%%37> p36:coprime(35, 64).
%%true
%%38> p36:coprime(35, 60).
%%false
%%39> p36:coprime(35, 61).
%%true
%%40> p36:coprime(35, 53).
%%true
