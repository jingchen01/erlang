%%%-------------------------------------------------------------------
%%1.18 (**) Extract a slice from a list.
%%Given two indices, I and K,
%%the slice is the list containing the elements
%%between the I'th and K'th element of the original list (both limits included).
%%Start counting the elements with 1.
%%
%%Example:
%%slice([a,b,c,d,e,f,g,h,i,k],3,7).
%%Result: [c,d,e,f,g]

%%%-------------------------------------------------------------------
-module(p18).
-author("chen_j").

%% API
-export([slice/3]).

slice(L, Start, End) ->
  lists:sublist(L, Start, End - Start + 1).


%%Test:
%%20> c(p18).
%%{ok,p18}
%%21> p18:slice([a,b,c,d,e,f,g,h,i,k],3,7).
%%[c,d,e,f,g]


