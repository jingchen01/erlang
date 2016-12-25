-module(t_linkedlist).
-compile(export_all).

% ---------------------------------------------------------------------------------------
% test function
% ---------------------------------------------------------------------------------------
main() ->
%    DataList = [data0, data1, data2, data3, data4, data5, data6, data7, data8],
  L = linkedlist:new(),
  test_list(L, "* New List"),
  L0 = linkedlist:add(data0, L),
  test_list(L0, "* add data0"),
  L1 = linkedlist:add(data1, L0),
  test_list(L1, "* add data1"),
  L2 = linkedlist:add(data2, L1),
  test_list(L2, "* add data2"),
  L3 = linkedlist:add_last(data3, L2),
  test_list(L3, "* add_last data3"),
  L4 = linkedlist:add_first(data4, L3),
  test_list(L4, "* add_first data4"),
  L5 = linkedlist:add(data5, 3, L4),
  test_list(L5, "* add data5 @ index=3"),
  L6 = linkedlist:remove(L5),
  test_list(L6, "* remove (head)"),
  L7 = linkedlist:remove_last(L6),
  test_list(L7, "* remove_last"),
  L8 = linkedlist:remove_first(L7),
  test_list(L8, "* remove_first"),
  ok.

test_list(List, Description) ->
  io:format("~s~n", [Description]),
  erlang:display(List),
  io:format("\n"),
  ok.

%%Test:
%%3> c(t_linkedlist).
%%{ok,t_linkedlist}
%%4> t_linkedlist:main().
%%* New List
%%{list,undefined,0}
%%
%%* add data0
%%{list,{node,data0,undefined},1}
%%
%%* add data1
%%{list,{node,data0,{node,data1,undefined}},2}
%%
%%* add data2
%%{list,{node,data0,{node,data1,{node,data2,undefined}}},3}
%%
%%* add_last data3
%%{list,{node,data0,{node,data1,{node,data2,{node,data3,undefined}}}},4}
%%
%%* add_first data4
%%{list,{node,data4,{node,data0,{node,data1,{node,data2,{node,data3,undefined}}}}},5}
%%
%%* add data5 @ index=3
%%{list,{node,data4,{node,data0,{node,data1,{node,data5,{node,data2,{node,data3,undefined}}}}}},6}
%%
%%* remove (head)
%%{list,{node,data0,{node,data1,{node,data5,{node,data2,{node,data3,undefined}}}}},5}
%%
%%* remove_last
%%{list,{node,data0,{node,data1,{node,data5,{node,data2,undefined}}}},4}
%%
%%* remove_first
%%{list,{node,data1,{node,data5,{node,data2,undefined}}},3}

