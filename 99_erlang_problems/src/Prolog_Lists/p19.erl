%%%-------------------------------------------------------------------
%%1.19 (**) Rotate a list N places to the left.
%%Examples:
%%rotate([a,b,c,d,e,f,g,h],3).
%%Result: [d,e,f,g,h,a,b,c]
%%
%%rotate([a,b,c,d,e,f,g,h],-2).
%%Result: [g,h,a,b,c,d,e,f]
%%
%%Hint: Use the predefined predicates length/2 and append/3, as well as the result of problem 1.17.

%%%-------------------------------------------------------------------
-module(p19).
-author("chen_j").

%% API
-export([rotate/2, rotate2/2]).

rotate(L, K) ->
  Length = length(L),
  if
    K =:= 0 -> L;
    K > Length -> L;
    K < -Length -> L;
    K > 0 -> lists:sublist(L, K + 1, Length - K) ++ lists:sublist(L, K);
    K < 0 -> lists:sublist(L, Length + K + 1, -K) ++ lists:sublist(L, Length + K)
  end.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rotate2(List, N) ->
  Length = length(List),
  Times =
    case N rem Length of
      R when R >= 0 ->
        R;
      R when R < 0 ->
        Length + R
    end,
  {Left, Right} = split(List, Times),
  Right ++ Left.


split(List, 0) ->
  {[], List};
split([H | T], N) ->
  {Front, Rear} = split(T, N - 1),
  {[H | Front], Rear}.


%%Test:
%%67> c(p19).
%%{ok,p19}
%%68> p19:rotate([a,b,c,d,e,f,g,h],0).
%%[a,b,c,d,e,f,g,h]
%%69> p19:rotate([a,b,c,d,e,f,g,h],10).
%%[a,b,c,d,e,f,g,h]
%%70> p19:rotate([a,b,c,d,e,f,g,h],-10).
%%[a,b,c,d,e,f,g,h]
%%71> p19:rotate([a,b,c,d,e,f,g,h],3).
%%[d,e,f,g,h,a,b,c]
%%72> p19:rotate([a,b,c,d,e,f,g,h],-2).
%%[g,h,a,b,c,d,e,f]
%%75> p19:rotate2([a,b,c,d,e,f,g,h],0).
%%[a,b,c,d,e,f,g,h]
%%76> p19:rotate2([a,b,c,d,e,f,g,h],10).
%%[c,d,e,f,g,h,a,b]
%%77> p19:rotate2([a,b,c,d,e,f,g,h],-10).
%%[g,h,a,b,c,d,e,f]
%%78> p19:rotate2([a,b,c,d,e,f,g,h],3).
%%[d,e,f,g,h,a,b,c]
%%79> p19:rotate2([a,b,c,d,e,f,g,h],-2).
%%[g,h,a,b,c,d,e,f]
