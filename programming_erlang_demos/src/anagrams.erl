%%%-------------------------------------------------------------------
%%% @author chen_j
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. Oct 2016 12:54 PM
%%%-------------------------------------------------------------------
-module(anagrams).
-author("chen_j").

%% API
-export([perms/1]).


perms([]) -> [[]];
perms(L) -> [[H | T] || H <- L, T <- perms(L -- [H])].

%%This is exactly what the perms function does.
%%[ [H|T] || H <- L, T <- perms(L -- [H]) ]
%%This means take H from L in all possible ways and then take T from perms(L - - [H])
%%(that is, all permutations of the list L with H removed) in all possible ways and
%%return [H|T].

%% Result
%%26> anagrams:perms("123").
%%["123","132","213","231","312","321"]
%%27> anagrams:perms("him").
%%["him","hmi","ihm","imh","mhi","mih"]
%%29> anagrams:perms("her").
%%["her","hre","ehr","erh","rhe","reh"]
%%30> anagrams:perms("abcd").
%%["abcd","abdc","acbd","acdb","adbc","adcb","bacd","badc",
%%"bcad","bcda","bdac","bdca","cabd","cadb","cbad","cbda",
%%"cdab","cdba","dabc","dacb","dbac","dbca","dcab","dcba"]