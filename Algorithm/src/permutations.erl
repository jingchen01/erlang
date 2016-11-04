%%%-------------------------------------------------------------------
%%% permutations
%%%-------------------------------------------------------------------
-module(permutations).
-author("chen_j").

%% API
-export([perms/1]).


perms([]) -> [[]];
perms(L) -> [[H | T] || H <- L, T <- perms(L--[H])].


%%Test:
%%6> c(permutations).
%%{ok,permutations}
%%7> permutations:perms([1,2,3]).
%%[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
%%8> permutations:perms([a,b]).
%%[[a,b],[b,a]]
%%9> permutations:perms([a,b,c]).
%%[[a,b,c],[a,c,b],[b,a,c],[b,c,a],[c,a,b],[c,b,a]]
