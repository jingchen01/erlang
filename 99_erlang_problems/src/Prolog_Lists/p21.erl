%%%-------------------------------------------------------------------
%%1.21 (*) Insert an element at a given position into a list.
%%Example:
%%insert_at(alfa,[a,b,c,d],2).
%%Result: [a,alfa,b,c,d]
%%%-------------------------------------------------------------------
-module(p21).
-author("chen_j").

%% API
-export([insert_at/3]).


insert_at(Insert, L, Position) ->
  Length = length(L),
  if
    Position < 1 -> L;
    Position > Length -> L;
    Length =:= 0 -> [];
    true ->
      lists:sublist(L, Position - 1) ++ [Insert] ++ lists:sublist(L, Position, Length - Position + 1)
  end.


%%Test:
%%88> c(p21).
%%{ok,p21}
%%89> p21:insert_at(alfa,[a,b,c,d],-1).
%%[a,b,c,d]
%%90> p21:insert_at(alfa,[a,b,c,d],0).
%%[a,b,c,d]
%%91> p21:insert_at(alfa,[a,b,c,d],1).
%%[alfa,a,b,c,d]
%%92> p21:insert_at(alfa,[a,b,c,d],2).
%%[a,alfa,b,c,d]
%%93> p21:insert_at(alfa,[a,b,c,d],3).
%%[a,b,alfa,c,d]
%%94> p21:insert_at(alfa,[a,b,c,d],4).
%%[a,b,c,alfa,d]
%%95> p21:insert_at(alfa,[a,b,c,d],5).
%%[a,b,c,d]
%%96> p21:insert_at(alfa,[a,b,c,d],6).
%%[a,b,c,d]
%%97> p21:insert_at(alfa,[],1).
%%[]
