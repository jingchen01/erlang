%%%-------------------------------------------------------------------
%%Dentists check the health of your gums by checking the depth of the “pockets” at
%%six different locations around each of your 32 teeth. The depth is measured in millimeters.
%%If any of the depths is greater than or equal to four millimeters, that tooth needs attention.
%%(Thanks to Dr. Patricia Lee, DDS, for explaining this to me.)
%%Your task is to write a module named teeth and a function named alert/1.
%%The function takes a list of 32 lists of six numbers as its input. If a tooth isn’t present,
%%it is represented by the list [0] instead of a list of six numbers.
%%The function produces a list of the tooth numbers that require attention.
%%The numbers must be in ascending order.
%%Here’s a set of pocket depths for a person who has had her upper wisdom teeth, numbers 1 and 16, removed.
%%Just copy and paste it.
%%
%%PocketDepths = [[0], [2,2,1,2,2,1], [3,1,2,3,2,3],
%%[3,1,3,2,1,2], [3,2,3,2,2,1], [2,3,1,2,1,1],
%%[3,1,3,2,3,2], [3,3,2,1,3,1], [4,3,3,2,3,3],
%%[3,1,1,3,2,2], [4,3,4,3,2,3], [2,3,1,3,2,2],
%%[1,2,1,1,3,2], [1,2,2,3,2,3], [1,3,2,1,3,3], [0],
%%[3,2,3,1,1,2], [2,2,1,1,3,2], [2,1,1,1,1,2],
%%[3,3,2,1,1,3], [3,1,3,2,3,2], [3,3,1,2,3,3],
%%[1,2,2,3,3,3], [2,2,3,2,3,3], [2,2,2,4,3,4],
%%[3,4,3,3,3,4], [1,1,2,3,1,2], [2,2,3,2,1,3],
%%[3,4,2,4,4,3], [3,3,2,1,2,3], [2,2,2,2,3,3],
%%[3,2,3,2,3,2]].


%%%-------------------------------------------------------------------
-module(teeth).
-author("chen_j").

%% API
-export([alert/1]).


%%

alert(PocketDepths) ->
  Length = length(PocketDepths),
  if
    Length =:= 32 ->
      alert(PocketDepths, 1, []);
    true -> "Please input valid PocketDepths."
  end.

alert([], _ToothNumber, Result) ->
  lists:reverse(Result);

alert(PocketDepths, ToothNumber, Result) ->
  %%pattern matching
  [Head | Tail] = PocketDepths,
  %% Head is CurrentToothData
  MaxDepth = lists:max(Head),
  if
    MaxDepth >= 4 -> alert(Tail, ToothNumber + 1, [ToothNumber | Result]);
    true -> alert(Tail, ToothNumber + 1, Result)
  end.


%%Test:
%%3> PocketDepths = [[0], [2,2,1,2,2,1], [3,1,2,3,2,3],[3,1,3,2,1,2], [3,2,3,2,2,1], [2,3,1,2,1,1],[3,1,3,2,3,2], [3,3,2,1,3,1], [4,3,3,2,3,3],[3,1,1,3,2,2], [4,3,4,3,2,3], [2,3,1,3,2,2],[1,2,1,1,3,2], [1,2,2,3,2,3], [1,3,2,1,3,3], [0],[3,2,3,1,1,2], [2,2,1,1,3,2], [2,1,1,1,1,2],[3,3,2,1,1,3], [3,1,3,2,3,2], [3,3,1,2,3,3],[1,2,2,3,3,3], [2,2,3,2,3,3], [2,2,2,4,3,4],[3,4,3,3,3,4], [1,1,2,3,1,2], [2,2,3,2,1,3],[3,4,2,4,4,3], [3,3,2,1,2,3], [2,2,2,2,3,3],[3,2,3,2,3,2]].
%%[[0],
%%[2,2,1,2,2,1],
%%[3,1,2,3,2,3],
%%[3,1,3,2,1,2],
%%[3,2,3,2,2,1],
%%[2,3,1,2,1,1],
%%[3,1,3,2,3,2],
%%[3,3,2,1,3,1],
%%[4,3,3,2,3,3],
%%[3,1,1,3,2,2],
%%[4,3,4,3,2,3],
%%[2,3,1,3,2,2],
%%[1,2,1,1,3,2],
%%[1,2,2,3,2,3],
%%[1,3,2,1,3,3],
%%[0],
%%[3,2,3,1,1,2],
%%[2,2,1,1,3,2],
%%[2,1,1,1,1,2],
%%[3,3,2,1,1,3],
%%[3,1,3,2,3,2],
%%[3,3,1,2,3,3],
%%[1,2,2,3,3,3],
%%[2,2,3,2,3|...],
%%[2,2,2,4|...],
%%[3,4,3|...],
%%[1,1|...],
%%[2|...],
%%[...]|...]
%%
%%teeth:alert(PocketDepths).
%%[9,11,25,26,29]