%%%-------------------------------------------------------------------
%%% @author chen_j
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. Nov 2016 7:20 PM
%%%-------------------------------------------------------------------
-module(mapping_filtering).
-author("chen_j").

%% API
-export([get_even_numbers/1, power_of_even_numbers/2, square_of_even_numbers/1]).

get_even_numbers([]) ->
  [];
get_even_numbers(L) ->
  [X || X <- L, X > 0, X rem 2 == 0].

%%%%%%======================================

power_of_even_numbers([], _) ->
  [];
power_of_even_numbers(L, K) ->
  [math:pow(X, K) || X <- L, X > 0, X rem 2 == 0].

%%%%%%======================================

square_of_even_numbers(L) ->
  power_of_even_numbers(L, 2).


%%Test:
%%20> mapping_filtering:get_even_numbers([-8,16,15,10,-11,-5,7,2,0,32,15,1,3,0]).
%%[16,10,2,32]
%%21> mapping_filtering:power_of_even_numbers([],5).
%%[]
%%22> mapping_filtering:power_of_even_numbers([-8,16,15,10,-11,-5,7,2,0,32,15,1,3,0],3).
%%[4096.0,1.0e3,8.0,32768.0]
%%23> mapping_filtering:power_of_even_numbers([-8,16,15,10,-11,-5,7,2,0,32,15,1,3,0],5).
%%[1048576.0,1.0e5,32.0,33554432.0]
%%24> mapping_filtering:square_of_even_numbers([-8,16,15,10,-11,-5,7,2,0,32,15,1,3,0]).
%%[256.0,100.0,4.0,1024.0]
%%25> mapping_filtering:power_of_even_numbers([-8,16,15,10,-11,-5,7,2,0,32,15,1,3,0],2).
%%[256.0,100.0,4.0,1024.0]
%%26>
