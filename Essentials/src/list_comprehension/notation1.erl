%%%-------------------------------------------------------------------
%%% @author chen_j
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. Nov 2016 7:13 PM
%%%-------------------------------------------------------------------
-module(notation1).
-author("chen_j").

%% API
-export([positive_integers/1]).

positive_integers([]) ->
  [];
positive_integers(List) ->
  [X || X <- List, X > 0].

%%Test:
%%1> c(notation1).
%%{ok,notation1}
%%2> notation1:positive_integers([-8,10,-11,-5,0,7,0,15,1,3]).
%%[10,7,15,1,3]
