-module(clock).
-export([start/2, stop/0]).
start(Time, Fun) ->
  register(clock, spawn(fun() -> tick(Time, Fun) end)).
stop() -> clock ! stop.
tick(Time, Fun) ->
  receive
    stop ->
      void
  after Time ->
    Fun(),
    tick(Time, Fun)
  end.


%%Test:
%%7> c(clock).
%%{ok,clock}
%%8> clock:start(5000, fun() -> io:format("TICK ~p~n",[erlang:now()]) end).
%%true
%%TICK {1478,299835,580337}
%%TICK {1478,299840,581208}
%%TICK {1478,299845,582328}
%%TICK {1478,299850,583258}
%%TICK {1478,299855,584290}
%%9> clock:stop().
%%stop
