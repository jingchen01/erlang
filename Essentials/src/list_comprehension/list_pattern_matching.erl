%%%-------------------------------------------------------------------
%%% @author chen_j
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. Nov 2016 7:51 PM
%%%-------------------------------------------------------------------
-module(list_pattern_matching).
-author("chen_j").

%% API
-export([area/1, get_rectangle_area/1]).

area({circle, Radius}) ->
  Radius * Radius * math:pi();
area({square, Side}) ->
  Side * Side;
area({rectangle, Height, Width}) ->
  Height * Width.


get_rectangle_area([]) ->
  [];

%%Shapes: tuple list
get_rectangle_area(Shapes) ->
  [{area, H * W} || {rectangle, H, W} <- Shapes, H * W >= 10].


%%Test:
%%29> c(list_pattern_matching).
%%{ok,list_pattern_matching}
%%30> L = [{circle, 5},{square, 6},{rectangle, 3 ,6},{rectangle,8,10},{triangle, 6,7,8},{square,8}].
%%[{circle,5},
%%{square,6},
%%{rectangle,3,6},
%%{rectangle,8,10},
%%{triangle,6,7,8},
%%{square,8}]
%%31> list_pattern_matching:get_rectangle_area(L).
%%[{area,18},{area,80}]
