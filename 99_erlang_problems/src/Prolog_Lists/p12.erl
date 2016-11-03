%%%-------------------------------------------------------------------

%%1.12 (**) Decode a run-length encoded list.
%%Given a run-length code list generated as specified in problem 1.11.
%%Construct its uncompressed version.

%%decode([{4,a},b,{2,c},{2,a},d,{4,e}]).
%% Result: [a,a,a,a,b,c,c,a,a,d,e,e,e,e]

%%decode2([[a,4],b,[c,2],[a,2],d,[e,4]]).
%% Result: [a,a,a,a,b,c,c,a,a,d,e,e,e,e]

%%%-------------------------------------------------------------------

-module(p12).
-export([decode/1, decode2/1]).

decode([]) ->
  [];
decode([{0, _} | T]) ->
  decode(T);
decode([{N, E} | T]) ->
  [E | decode([{N - 1, E} | T])];
decode([E | T]) ->
  [E | decode(T)].


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


decode2([]) ->
  [];
decode2([H | T]) ->
  if
    is_list(H) ->
      [Element, Number] = H,
      lists:append(repeat(Element, Number), decode2(T));
    true ->
      lists:append([H], decode2(T))
  end.

repeat(_, 0) ->
  [];
repeat(H, Number) ->
  [H | repeat(H, Number - 1)].


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%Test:
%%45> p12:decode([{4,a},b,{2,c},{2,a},d,{4,e}]).
%%[a,a,a,a,b,c,c,a,a,d,e,e,e,e]
%%46> p12:decode2([[a,4],b,[c,2],[a,2],d,[e,4]]).
%%[a,a,a,a,b,c,c,a,a,d,e,e,e,e]


