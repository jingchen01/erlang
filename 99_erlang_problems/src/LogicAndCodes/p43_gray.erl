%%%-------------------------------------------------------------------
%%3.04 (**) Gray code.
%%An n-bit Gray code is a sequence of n-bit strings constructed according to certain rules. For example,
%%n = 1: C(1) = ['0','1'].
%%n = 2: C(2) = ['00','01','11','10'].
%%n = 3: C(3) = ['000','001','011','010','110','111','101','100'].
%%
%%Find out the construction rules and write a predicate with the following specification:
%%
%%% gray(N,C) :- C is the N-bit Gray code
%%
%%Can you apply the method of "result caching" in order to make the predicate more efficient,
%%when it is to be used repeatedly?

%%%-------------------------------------------------------------------
-module(p43_gray).
-author("chen_j").

%% API
-export([encode/1, decode/1, encode2/1, decode2/1]).

encode(N) -> N bxor (N bsr 1).

decode(G) -> decode(G, 0).

decode(0, N) -> N;
decode(G, N) -> decode(G bsr 1, G bxor N).


%%%%%%======================================


encode2(Binary) when is_integer(Binary) ->
  Binary bxor (Binary bsr 1).

decode2(0) ->
  0;
decode2(Gray) when is_integer(Gray) ->
  Gray bxor decode2(Gray bsr 1).

