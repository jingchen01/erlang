%%%-------------------------------------------------------------------
%%1.04 (*) Find the number of elements of a list.
%%%-------------------------------------------------------------------
-module(p04).
-author("chen_j").

%% API
-export([number_of_elements/1, number_of_elements2/1]).

number_of_elements(L) ->
  if
    is_list(L) -> length(L);
    true -> 0
  end.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


number_of_elements2([]) ->
  0;
number_of_elements2([_ | T]) ->
  1 + number_of_elements2(T).


%%Test:
%%72> c(p04).
%%{ok,p04}
%%73> p04:number_of_elements([1,2,[3,4],5]).
%%4
%%74>  p04:number_of_elements([1,2,3,4,5]).
%%5
%%75>  p04:number_of_elements2([1,2,3,4,5]).
%%5
%%76> p04:number_of_elements2([1,2,[3,4],5]).
%%4
%%77> p04:number_of_elements2([5]).
%%1
%%78> p04:number_of_elements([5]).
%%1
%%79> p04:number_of_elements(5).
%%0
%%80> p04:number_of_elements2(5).
%%** exception error: no function clause matching p04:number_of_elements2(5) (p04.erl, line 19)
%%81> p04:number_of_elements2([]).
%%0
%%82> p04:number_of_elements([]).
%%0
