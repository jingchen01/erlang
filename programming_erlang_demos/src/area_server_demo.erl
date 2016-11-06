-module(area_server_demo).
-export([start/0, area/2, loop/0]).
start() -> spawn(area_server_demo, loop, []).

area(Pid, What) ->
  rpc(Pid, What).

rpc(Pid, Request) ->
  Pid ! {self(), Request},
  receive
    {Pid, Response} ->
      Response
  end.

loop() ->
  receive
    {From, {rectangle, Width, Height}} ->
      From ! {self(), Width * Height},
      io:format("Area of rectangle is ~p~n", [Width * Height]),
      loop();
    {From, {circle, R}} ->
      From ! {self(), 3.14159 * R * R},
      io:format("Area of circle is ~p~n", [3.14159 * R * R]),
      loop();
    {From, {square, Side}} ->
      From ! {self(), Side * Side},
      io:format("Area of square is ~p~n", [Side * Side]),
      loop();
    {From, Other} ->
      From ! {self(), {error, Other}},
      loop()
  end.


%%Test:
%%1> c(area_server0).
%%{ok,area_server0}
%%2> Pid01 = spawn(area_server0, loop, []).
%%<0.66.0>
%%3> area_server0:area(Pid01, {rectangle, 5,6}).
%%Area of rectangle is 30
%%30
%%4> area_server0:area(Pid01, {square , 6}).
%%Area of square is 36
%%36
%%5> area_server0:area(Pid01, {circle, 5}).
%%Area of circle is 78.53975
%%78.53975
%%6> area_server0:area(Pid01, {triangle, 5}).
%%{error,{triangle,5}}
%%7> area_server0:area(Pid01, {triangle, 5, 6}).
%%{error,{triangle,5,6}}
