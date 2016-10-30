%%%-------------------------------------------------------------------
%%% @author chen_j
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. Oct 2016 7:32 PM
%%
%%2. The BIF tuple_to_list(T) converts the elements of the tuple T to a list. Write a
%%function called my_tuple_to_list(T) that does the same thing only not using
%%the BIF that does this.
%%%-------------------------------------------------------------------
-module(my_tuple_to_list).
-author("chen_j").

%% API
-export([convert_tuple_to_list/1]).

% Convert a tuple to a list without using the BIF
convert_tuple_to_list(Tuple) ->
  % Get the size of the tuple so we know how many items
  % to copy over to the list.
  TupleSize = tuple_size(Tuple),
  do_convert_tuple_to_list(TupleSize, Tuple, []).

% Once there are no remaining items in the
% tuple return the list
do_convert_tuple_to_list(0, _tuple, L) ->
  L;

% Take the last item of the tuple and added it to
% the beginning of the list (list is created in
% reverse order).
do_convert_tuple_to_list(PreviousIndex, Tuple, L) ->
  PreviousElement = element(PreviousIndex, Tuple),
  do_convert_tuple_to_list(PreviousIndex - 1, Tuple, [PreviousElement | L]).

%%result:
%%21> c(my_tuple_to_list).
%%{ok,my_tuple_to_list}
%%22> my_tuple_to_list:convert_tuple_to_list({1,5,8,1,3,0}).
%%[1,5,8,1,3,0]


