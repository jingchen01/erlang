-module(area_server_final).
-export([start/0, area/2, loop/0]).
start() -> spawn(area_server_final, loop, []).
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
    {From, {rectangle, Width, Ht}} ->
      From ! {self(), Width * Ht},
      loop();
    {From, {circle, R}} ->
      From ! {self(), 3.14159 * R * R},
      loop();
    {From, Other} ->
      From ! {self(), {error, Other}},
      loop()
  end.

%%Test:
%%3> Pid = spawn(area_server_final, loop, []).
%%<0.67.0>
%%4> area_server_final:area(Pid, {rectangle, 5,6}).
%%30
%%5> area_server_final:area(Pid, {square,6}).
%%{error,{square,6}}
%%10> area_server_final:area(Pid, {circle, 6}).
%%113.09723999999999