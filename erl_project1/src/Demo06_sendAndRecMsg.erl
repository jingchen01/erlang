%%%-------------------------------------------------------------------
%%% @author chen_j
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. Aug 2016 11:59 AM
%%%-------------------------------------------------------------------
-module('Demo06_sendAndRecMsg').
-author("chen_j").

%% API
-export([]).


-export([messageRec/0]).

messageRec() ->
  receive
    {factorial, Int} ->
      io:format("Factorial for ~p is ~p ~n", [Int, factorial(Int, 1)]),
      messageRec();
    {factorialRecorder, Int} ->
      {ok, IoDevice} = file:open("/Users/chen_j/Develop/Erlang/ErlangWorkspace/erl_project01/output", write),
      factorialRecorder(Int, 1, IoDevice),
      io:format("Factorial Recorder Done. ~n", []),
      file:close(IoDevice),
      messageRec();
    Other ->
      io:format("Invalid Match for ~p~n", [Other]),
      messageRec()
  end.


%% private function
factorial(Int, Acc) when Int > 0 ->
  factorial(Int - 1, Acc * Int);
factorial(0, Acc) ->
  Acc.

factorialRecorder(Int, Acc, IoDevice) when Int > 0 ->
  io:format(IoDevice, "Current Factorial Log: ~p~n", [Acc]),
  factorialRecorder(Int - 1, Acc * Int, IoDevice);
factorialRecorder(0, Acc, IoDevice) ->
  io:format(IoDevice, "Factorial Results: ~p~n", [Acc]).