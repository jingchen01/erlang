-module(test_gray).
-import(p43_gray, [encode/1, decode/1, encode2/1, decode2/1]).
%%-export([main/1, test_encode/1, test_encode/2,
%%  main2/1, test_encode2/1, test_encode2/2]).
-compile(export_all).

test_encode(N) ->
  G = p43_gray:encode(N),
  D = p43_gray:decode(G),
  io:fwrite("~2B : ~5.2.0B : ~5.2.0B : ~5.2.0B : ~2B~n", [N, N, G, D, D]).

test_encode(N, N) -> [];
test_encode(I, N) when I < N ->
  test_encode(I), test_encode(I + 1, N).

main(X) -> test_encode(0, X).

%%%%%%======================================

test_encode2(N) ->
  G = p43_gray:encode2(N),
  D = p43_gray:decode2(G),
  io:fwrite("~2B : ~5.2.0B : ~5.2.0B : ~5.2.0B : ~2B~n", [N, N, G, D, D]).

test_encode2(N, N) -> [];
test_encode2(I, N) when I < N ->
  test_encode2(I), test_encode2(I + 1, N).

main2(X) -> test_encode2(0, X).


%%%%%%======================================


%%Test:
%%84> c(test_gray).
%%{ok,test_gray}
%%85> test_gray:main(6).
%%0 : 00000 : 00000 : 00000 :  0
%%1 : 00001 : 00001 : 00001 :  1
%%2 : 00010 : 00011 : 00010 :  2
%%3 : 00011 : 00010 : 00011 :  3
%%4 : 00100 : 00110 : 00100 :  4
%%5 : 00101 : 00111 : 00101 :  5
%%[]
%%86> test_gray:test_encode(3).
%%3 : 00011 : 00010 : 00011 :  3
%%ok
%%87> test_gray:test_encode(2,5).
%%2 : 00010 : 00011 : 00010 :  2
%%3 : 00011 : 00010 : 00011 :  3
%%4 : 00100 : 00110 : 00100 :  4
%%[]
%%101> test_gray:main2(6).
%%0 : 00000 : 00000 : 00000 :  0
%%1 : 00001 : 00001 : 00001 :  1
%%2 : 00010 : 00011 : 00010 :  2
%%3 : 00011 : 00010 : 00011 :  3
%%4 : 00100 : 00110 : 00100 :  4
%%5 : 00101 : 00111 : 00101 :  5
%%[]
%%102> test_gray:test_encode2(3).
%%3 : 00011 : 00010 : 00011 :  3
%%ok
%%103> test_gray:test_encode2(2,5).
%%2 : 00010 : 00011 : 00010 :  2
%%3 : 00011 : 00010 : 00011 :  3
%%4 : 00100 : 00110 : 00100 :  4
%%[]

