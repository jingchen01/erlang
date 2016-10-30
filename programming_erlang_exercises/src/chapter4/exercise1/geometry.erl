%%%-------------------------------------------------------------------
%%% @author chen_j
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. Oct 2016 6:58 PM

%%% Extend geometry.erl. Add clauses to compute the areas of circles and rightangled
%%% triangles. Add clauses for computing the perimeters of different
%%% geometric objects.
%%%-------------------------------------------------------------------
-module(geometry).
-author("chen_j").

%% API
-export([area/1, perimeter/1]).

area({rectangle, Width, Height}) -> Width * Height;
area({square, Side}) -> Side * Side;
area({circle, Radius}) -> Radius * Radius * math:pi();
area({rightangled_triangle, Height, Width}) -> Height * Width / 2.

perimeter({rectangle, Width, Height}) -> 2 * (Width + Height);
perimeter({square, Side}) -> 4 * Side;
perimeter({circle, Radius}) -> 2 * math:pi() * Radius;
perimeter({rightangled_triangle, Height, Width}) ->
  Height + Width + math:sqrt(Height * Height + Width * Width).

%%result:
%%3> c(geometry).
%%{ok,geometry}
%%4> geometry:area({circle,3}).
%%28.274333882308138
%%5> geometry:area({rectangle,3,4}).
%%12
%%6> geometry:area({square,3}).
%%9
%%8> geometry:area({rightangled_triangle,3,4}).
%%6.0
%%9> geometry:perimeter({rectangle,3,4}).
%%14
%%10> geometry:perimeter({square,3}).
%%12
%%11> geometry:perimeter({circle,3}).
%%18.84955592153876
%%12> geometry:perimeter({rightangled_triangle,3,4}).
%%12.0
