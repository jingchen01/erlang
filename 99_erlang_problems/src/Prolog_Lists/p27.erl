%%%-------------------------------------------------------------------
%%1.27 (**) Group the elements of a set into disjoint subsets.
%%a) In how many ways can a group of 9 people work in 3 disjoint subgroups of 2, 3 and 4 persons?
%%Write a predicate that generates all the possibilities via backtracking.
%%
%%Example:
%%?- group3([aldo,beat,carla,david,evi,flip,gary,hugo,ida]).
%%Result:(2 persons) [aldo,beat], (3 persons) [carla,david,evi], (4 persons) [flip,gary,hugo,ida]
%%...
%%
%%b) Generalize the above predicate in a way that we can specify
%%a list of group sizes and the predicate will return a list of groups.
%%
%%Example:
%%?- group([aldo,beat,carla,david,evi,flip,gary,hugo,ida],[2,2,5]).
%%Result: [[aldo,beat],[carla,david],[evi,flip,gary,hugo,ida]]
%%...
%%
%%Note that we do not want permutations of the group members; i.e.
%%[[aldo,beat],...] is the same solution as [[beat,aldo],...].
%%However, we make a difference between [[aldo,beat],[carla,david],...]
%%and [[carla,david],[aldo,beat],...].
%%
%%You may find more about this combinatorial problem in a good book on discrete mathematics under
%%the term "multinomial coefficients".

%%%-------------------------------------------------------------------
-module(p27).
-author("chen_j").

%% API
-export([combination/2, group/2, group3/1]).


combination(0, L) ->
  [{[], L}];
combination(_, []) ->
  [];
combination(N, [H | T]) ->
  [{[H | Choice], Rest} || {Choice, Rest} <- combination(N - 1, T)]
  ++
  [{Choice, [H | Rest]} || {Choice, Rest} <- combination(N, T)].


group(_, []) ->
  [[]];
group(List, [H | T]) ->
  [[Choice | Group]
    || {Choice, Rest} <- combination(H, List),
    Group <- group(Rest, T)].

group3(List) ->
  group(List, [2, 3, 4]).


%%Test:
%%
%%176> p27:group3([aldo,beat,carla,david,evi,flip,gary,hugo,ida]).
%%[[[aldo,beat],[carla,david,evi],[flip,gary,hugo,ida]],
%%[[aldo,beat],[carla,david,flip],[evi,gary,hugo,ida]],
%%[[aldo,beat],[carla,david,gary],[evi,flip,hugo,ida]],
%%[[aldo,beat],[carla,david,hugo],[evi,flip,gary,ida]],
%%[[aldo,beat],[carla,david,ida],[evi,flip,gary,hugo]],
%%[[aldo,beat],[carla,evi,flip],[david,gary,hugo,ida]],
%%[[aldo,beat],[carla,evi,gary],[david,flip,hugo,ida]],
%%[[aldo,beat],[carla,evi,hugo],[david,flip,gary,ida]],
%%[[aldo,beat],[carla,evi,ida],[david,flip,gary,hugo]],
%%[[aldo,beat],[carla,flip,gary],[david,evi,hugo,ida]],
%%[[aldo,beat],[carla,flip,hugo],[david,evi,gary,ida]],
%%[[aldo,beat],[carla,flip,ida],[david,evi,gary,hugo]],
%%[[aldo,beat],[carla,gary,hugo],[david,evi,flip,ida]],
%%[[aldo,beat],[carla,gary,ida],[david,evi,flip,hugo]],
%%[[aldo,beat],[carla,hugo,ida],[david,evi,flip,gary]],
%%[[aldo,beat],[david,evi,flip],[carla,gary,hugo,ida]],
%%[[aldo,beat],[david,evi,gary],[carla,flip,hugo,ida]],
%%[[aldo,beat],[david,evi,hugo],[carla,flip,gary,ida]],
%%[[aldo,beat],[david,evi,ida],[carla,flip,gary,hugo]],
%%[[aldo,beat],[david,flip,gary],[carla,evi,hugo,ida]],
%%[[aldo,beat],[david,flip,hugo],[carla,evi,gary,ida]],
%%[[aldo,beat],[david,flip,ida],[carla,evi,gary,hugo]],
%%[[aldo,beat],[david,gary,hugo],[carla,evi,flip|...]],
%%[[aldo,beat],[david,gary,ida],[carla,evi|...]],
%%[[aldo,beat],[david,hugo|...],[carla|...]],
%%[[aldo,beat],[evi|...],[...]],
%%[[aldo|...],[...]|...],
%%[[...]|...],
%%[...]|...]
%%
%%177> p27:group([aldo,beat,carla,david,evi,flip,gary,hugo,ida],[2,2,5]).
%%[[[aldo,beat],[carla,david],[evi,flip,gary,hugo,ida]],
%%[[aldo,beat],[carla,evi],[david,flip,gary,hugo,ida]],
%%[[aldo,beat],[carla,flip],[david,evi,gary,hugo,ida]],
%%[[aldo,beat],[carla,gary],[david,evi,flip,hugo,ida]],
%%[[aldo,beat],[carla,hugo],[david,evi,flip,gary,ida]],
%%[[aldo,beat],[carla,ida],[david,evi,flip,gary,hugo]],
%%[[aldo,beat],[david,evi],[carla,flip,gary,hugo,ida]],
%%[[aldo,beat],[david,flip],[carla,evi,gary,hugo,ida]],
%%[[aldo,beat],[david,gary],[carla,evi,flip,hugo,ida]],
%%[[aldo,beat],[david,hugo],[carla,evi,flip,gary,ida]],
%%[[aldo,beat],[david,ida],[carla,evi,flip,gary,hugo]],
%%[[aldo,beat],[evi,flip],[carla,david,gary,hugo,ida]],
%%[[aldo,beat],[evi,gary],[carla,david,flip,hugo,ida]],
%%[[aldo,beat],[evi,hugo],[carla,david,flip,gary,ida]],
%%[[aldo,beat],[evi,ida],[carla,david,flip,gary,hugo]],
%%[[aldo,beat],[flip,gary],[carla,david,evi,hugo,ida]],
%%[[aldo,beat],[flip,hugo],[carla,david,evi,gary,ida]],
%%[[aldo,beat],[flip,ida],[carla,david,evi,gary,hugo]],
%%[[aldo,beat],[gary,hugo],[carla,david,evi,flip,ida]],
%%[[aldo,beat],[gary,ida],[carla,david,evi,flip,hugo]],
%%[[aldo,beat],[hugo,ida],[carla,david,evi,flip,gary]],
%%[[aldo,carla],[beat,david],[evi,flip,gary,hugo|...]],
%%[[aldo,carla],[beat,evi],[david,flip,gary|...]],
%%[[aldo,carla],[beat,flip],[david,evi|...]],
%%[[aldo,carla],[beat,gary],[david|...]],
%%[[aldo,carla],[beat|...],[...]],
%%[[aldo|...],[...]|...],
%%[[...]|...],
%%[...]|...]
