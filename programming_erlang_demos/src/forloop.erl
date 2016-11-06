%%%-------------------------------------------------------------------
%%% @author chen_j
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. Oct 2016 4:00 PM
%%%-------------------------------------------------------------------
-module(forloop).
-author("chen_j").

%% API
-export([for/3]).

for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I) | for(I + 1, Max, F)].




