-module(tree).

-export([empty/0, insert/3, lookup/2]).

empty() ->
  {node, 'nil'}.

insert(Key, Val, {node, 'nil'}) ->
  {node, {Key, Val, {node, 'nil'}, {node, 'nil'}}};

%% 一つのノードは`{node, {Key, Val, Smaller, Larger}}`で表現する
insert(NewKey, NewVal, {node, {Key, Val, Smaller, Larger}}) when NewKey < Key ->
  {node, {Key, Val, insert(NewKey, NewVal, Smaller), Larger}};

insert(NewKey, NewVal, {node, {Key, Val, Smaller, Larger}}) when NewKey > Key ->
  {node, {Key, Val, Smaller, insert(NewKey, NewVal, Larger)}};

insert(Key, Val, {node, {Key, _, Smaller, Larger}}) ->
  {node, {Key, Val, Smaller, Larger}}.

lookup(_, {node, 'nil'}) ->
  undefined;
lookup(Key, {node, {Key, Val, _, _}}) ->
  Val;
lookup(Key, {node, {NodeKey, _NodeVal, Smaller, _Larger}}) when Key < NodeKey ->
  lookup(Key, Smaller);
lookup(Key, {node, {_NodeKey, _NodeVal, _Smaller, Larger}}) ->
  lookup(Key, Larger).


%%Test:
%%117> c(tree).
%%{ok,tree}
%%118> T1 = tree:insert("Jim Woodland", "jim.woodland@gmail.com", tree:empty()).
%%{node,{"Jim Woodland","jim.woodland@gmail.com",
%%{node,nil},
%%{node,nil}}}
%%119> T2 = tree:insert("Mark Anderson", "i.am.a@hotmail.com", T1).
%%{node,{"Jim Woodland","jim.woodland@gmail.com",
%%{node,nil},
%%{node,{"Mark Anderson","i.am.a@hotmail.com",
%%{node,nil},
%%{node,nil}}}}}
%%120> T3 = tree:insert("Anita Bath", "abath@someuni.edu", T2).
%%{node,{"Jim Woodland","jim.woodland@gmail.com",
%%{node,{"Anita Bath","abath@someuni.edu",
%%{node,nil},
%%{node,nil}}},
%%{node,{"Mark Anderson","i.am.a@hotmail.com",
%%{node,nil},
%%{node,nil}}}}}
%%121> T4 = tree:insert("Kevin Robert", "myfairy@yahoo.com", T3).
%%{node,{"Jim Woodland","jim.woodland@gmail.com",
%%{node,{"Anita Bath","abath@someuni.edu",
%%{node,nil},
%%{node,nil}}},
%%{node,{"Mark Anderson","i.am.a@hotmail.com",
%%{node,{"Kevin Robert","myfairy@yahoo.com",
%%{node,nil},
%%{node,nil}}},
%%{node,nil}}}}}
%%122> T5 = tree:insert("Wilson Longbrow", "longwil@gmail.com", T4).
%%{node,{"Jim Woodland","jim.woodland@gmail.com",
%%{node,{"Anita Bath","abath@someuni.edu",
%%{node,nil},
%%{node,nil}}},
%%{node,{"Mark Anderson","i.am.a@hotmail.com",
%%{node,{"Kevin Robert","myfairy@yahoo.com",
%%{node,nil},
%%{node,nil}}},
%%{node,{"Wilson Longbrow","longwil@gmail.com",
%%{node,nil},
%%{node,nil}}}}}}}
%%123> tree:lookup("Anita Bath", T5).
%%"abath@someuni.edu"
%%124> tree:lookup("Anita", T5).
%%undefined
