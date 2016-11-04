%%%-------------------------------------------------------------------
%%1.26 (**) Generate the combinations of K distinct objects chosen from the N elements of a list
%%In how many ways can a committee of 3 be chosen from a group of 12 people?
%%We all know that there are C(12,3) = 220 possibilities (C(N,K) denotes the well-known binomial coefficients).
%%For pure mathematicians, this result may be great.
%%But we want to really generate all the possibilities (via backtracking).
%%
%%Example:
%%combination(3,[a,b,c,d,e,f]).

%%Result:
%%L = [a,b,c] ;
%%L = [a,b,d] ;
%%L = [a,b,e] ;
%%...

%%%-------------------------------------------------------------------
-module(combinations).
-author("chen_j").

%% API
-export([combination/2, combination2/2]).

combination(0, _) ->
  [[]];
combination(_, []) ->
  [];
combination(N, [H | T]) ->
  %%[[H | Choice] || Choice <- combination(N - 1, T)] ++ combination(N, T).
  %% recommend use lists:concat/1 instead of ++
  lists:concat([[[H | Choice] || Choice <- combination(N - 1, T)], combination(N, T)]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


combination2(_, []) ->
  [];
combination2(1, Xs) ->
  [[X] || X <- Xs];
combination2(M, [X | Xs]) ->
  X1 = [[X | Ys] || Ys <- combination2(M - 1, Xs)],
  X2 = [Ys || Ys <- combination2(M, Xs)],
%%  X1 ++ X2.
  %% recommend use lists:concat/1 instead of ++
  lists:concat([X1, X2]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%Test:
%%167> c(p26).
%%{ok,p26}
%%168> p26:combination(3,[a,b,c,d,e,f]).
%%[[a,b,c],
%%[a,b,d],
%%[a,b,e],
%%[a,b,f],
%%[a,c,d],
%%[a,c,e],
%%[a,c,f],
%%[a,d,e],
%%[a,d,f],
%%[a,e,f],
%%[b,c,d],
%%[b,c,e],
%%[b,c,f],
%%[b,d,e],
%%[b,d,f],
%%[b,e,f],
%%[c,d,e],
%%[c,d,f],
%%[c,e,f],
%%[d,e,f]]
%%169> p26:combination(2,[a,b,c,d,e,f]).
%%[[a,b],
%%[a,c],
%%[a,d],
%%[a,e],
%%[a,f],
%%[b,c],
%%[b,d],
%%[b,e],
%%[b,f],
%%[c,d],
%%[c,e],
%%[c,f],
%%[d,e],
%%[d,f],
%%[e,f]]
%%170> p26:combination(1,[a,b,c]).
%%[[a],[b],[c]]
%%171> p26:combination(2,[a,b,c]).
%%[[a,b],[a,c],[b,c]]
%%172> p26:combination(3,[a,b,c]).
%%[[a,b,c]]
