-module(kitchen).
-compile(export_all).

start(FoodList) ->
  spawn(?MODULE, fridge2, [FoodList]).

store(Pid, Food) ->
  Pid ! {self(), {store, Food}},
  receive
    {Pid, Msg} -> Msg
  end.

take(Pid, Food) ->
  Pid ! {self(), {take, Food}},
  receive
    {Pid, Msg} -> Msg
  end.

store2(Pid, Food) ->
  Pid ! {self(), {store, Food}},
  receive
    {Pid, Msg} -> Msg
  after 3000 ->
    timeout
  end.

take2(Pid, Food) ->
  Pid ! {self(), {take, Food}},
  receive
    {Pid, Msg} -> Msg
  after 3000 ->
    timeout
  end.

fridge1() ->
  receive
    {From, {store, _Food}} ->
      From ! {self(), ok},
      fridge1();
    {From, {take, _Food}} ->
      %% uh....
      From ! {self(), not_found},
      fridge1();
    terminate ->
      ok
  end.

fridge2(FoodList) ->
  receive
    {From, {store, Food}} ->
      From ! {self(), ok},
      fridge2([Food | FoodList]);
    {From, {take, Food}} ->
      case lists:member(Food, FoodList) of
        true ->
          From ! {self(), {ok, Food}},
          fridge2(lists:delete(Food, FoodList));
        false ->
          From ! {self(), not_found},
          fridge2(FoodList)
      end;
    terminate ->
      ok
  end.


%%Test:
%%1> c(kitchen).
%%{ok,kitchen}
%%2> Pid = spawn(kitchen, fridge2, [[baking_soda]]).
%%<0.64.0>
%%3> flush().
%%ok
%%4> Pid ! {self(), {store, milk}}.
%%{<0.57.0>,{store,milk}}
%%5> flush().
%%Shell got {<0.64.0>,ok}
%%ok
%%6> Pid ! {self(), {store, bacon}}.
%%{<0.57.0>,{store,bacon}}
%%7> flush().
%%Shell got {<0.64.0>,ok}
%%ok
%%8> Pid ! {self(), {take, bacon}}.
%%{<0.57.0>,{take,bacon}}
%%9> Pid ! {self(), {take, turkey}}.
%%{<0.57.0>,{take,turkey}}
%%10>
%%10> flush().
%%Shell got {<0.64.0>,{ok,bacon}}
%%Shell got {<0.64.0>,not_found}
%%ok
%%11> Pid ! {self(), {take, baking_soda}}.
%%{<0.57.0>,{take,baking_soda}}
%%12> flush().
%%Shell got {<0.64.0>,{ok,baking_soda}}
%%ok
%%13> Pid ! {self(), {take, purified_water}}.
%%{<0.57.0>,{take,purified_water}}
%%14> flush().
%%Shell got {<0.64.0>,not_found}
%%ok
