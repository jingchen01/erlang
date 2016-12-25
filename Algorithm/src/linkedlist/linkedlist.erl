-module(linkedlist).
-compile(export_all).

-record(list, {head, length = 0}).
-record(node, {data, next}).

new() ->
  #list{}.

new_node(Data) ->
  #node{data = Data}.

head(List) ->
  List#list.head.

next(Node) ->
  Node#node.next.

length(List) ->
  List#list.length.

% ---------------------------------------------------------------------------------------
% Append the specified Node to the end of the list.
% ---------------------------------------------------------------------------------------
add(Data, List) when List =:= #list{} ->
  % when the list is empty
  % create new node (= head node)
  #list{head = new_node(Data), length = 1};
add(Data, List) ->
  % when the list is not empty
  NewHead = append_node(Data, head(List)),
  NewLength = linkedlist:length(List) + 1,
  #list{head = NewHead, length = NewLength}.

append_node(Data, Node) when Node#node.next =:= undefined ->
  % when the node does not know the next node (= the Node is Tail Node)
  Node#node{next = new_node(Data)};
append_node(Data, Node) ->
  % when the node know the next node
  % re-construct the Node
  Node#node{next = append_node(Data, Node#node.next)}.

% ---------------------------------------------------------------------------------------
% Inserts the specified Node at the specified position in the list.
% Shifts the Node currently at that position (if any)
% and any subsequent Nodess to the right. 
% 
% @throw indexOutOfBoundsException - if the specified index is out of range 
% (index < 0 || index >= size()).
% ---------------------------------------------------------------------------------------
add(_, Index, List) when ((List#list.length < Index) or (Index < 0)) ->
  % if the specified position is larger than List length,
  % throw excpetion.
  throw("indexOutOfBoundException");
add(Data, Index, List) when List#list.length =:= Index ->
  % if the specified position is same as the List length,
  % appends Node to the end of the list.
  add_last(Data, List);
add(Data, Index, List) when Index =:= 0 ->
  % if the specified position is 0,
  % insert the Node at the first position (=Head Node)
  add_first(Data, List);
add(Data, Index, List) ->
  % inserts Node at the specified position.
  NewHead = insert_node(Data, Index, 0, List#list.head),
  NewLength = linkedlist:length(List) + 1,
  #list{head = NewHead, length = NewLength}.

insert_node(Data, Index, Current, Node) when Index =:= Current ->
  % constructs the subsequent Node(s)
  #node{data = Data, next = Node};
insert_node(Data, Index, Current, Node) ->
  % steps forward
  NextNode = insert_node(Data, Index, Current + 1, Node#node.next),
  Node#node{next = NextNode}.

% ---------------------------------------------------------------------------------------
% Inserts the given Node at the beginning of this list.
% ---------------------------------------------------------------------------------------
add_first(Data, List) ->
  NewHead = #node{data = Data, next = head(List)},
  NewLength = linkedlist:length(List) + 1,
  #list{head = NewHead, length = NewLength}.

% ---------------------------------------------------------------------------------------
% Append the specified Node to the end of the list.
% (Identical in add/2 function; included only for consistency.) 
% ---------------------------------------------------------------------------------------
add_last(Data, List) ->
  add(Data, List).

% ---------------------------------------------------------------------------------------
% Removes the head Node of this list.
%
% @throw noSuchElementException - if this list is empty.
% ---------------------------------------------------------------------------------------
remove(List) when List#list.head =:= undefined ->
  throw("noSuchElementException");
remove(List) ->
  #list{head = (List#list.head)#node.next, length = List#list.length - 1}.

% ---------------------------------------------------------------------------------------
% Removes the Node at the specified position in this list.
% Shifts any subsequent Nodes to the left (subtracts one from their indices). 
%
% @throw indexOutOfBoundsException - if the specified index is out of range (index < 0 || index >= size()).
% ---------------------------------------------------------------------------------------
remove(Index, List) when ((List#list.length < Index) or (Index < 0)) ->
  throw("indexOutOfBoundException");
remove(Index, List) when Index =:= 0 ->
  % if the specified position is 0,
  % removes the first Node (= Head Node)
  remove_first(List);
remove(Index, List) when Index =:= List#list.length - 1 ->
  % if the specified position is the last position,
  % removes the last Node (= Tail Node)
  remove_last(List);
remove(Index, List) ->
  % removes the Node at the specified position
  NewHead = remove_node(Index, 0, List#list.head),
  NewLength = List#list.length - 1,
  #list{head = NewHead, length = NewLength}.

remove_node(Index, Current, Node) when Index =:= Current ->
  % constructs the subsequent Node(s)
  NextNode = Node#node.next,
  #node{data = NextNode#node.data, next = NextNode#node.next};

remove_node(Index, Current, Node) ->
  % steps forward
  NextNode = remove_node(Index, Current + 1, Node#node.next),
  Node#node{next = NextNode}.

% ---------------------------------------------------------------------------------------
% Removes the Node of at the begining of this list (=Head Node).
% (Identical in remove/0 function; included only for consistency.) 
%
% @throw noSuchElementException - if this list is empty.
% ---------------------------------------------------------------------------------------
remove_first(List) ->
  remove(List).

% ---------------------------------------------------------------------------------------
% Removes and returns the last Node from this list.
% ---------------------------------------------------------------------------------------
remove_last(List) ->
  NewHead = remove_last(List#list.head, List),
  NewLength = List#list.length - 1,
  #list{head = NewHead, length = NewLength}.

remove_last(Node, _) when Node#node.next =:= undefined ->
  undefined;
remove_last(Node, List) ->
  % steps forward
  NextNode = remove_last(Node#node.next, List),
  Node#node{next = NextNode}.

% ---------------------------------------------------------------------------------------
% Returns true if this list contains the specified Node. 
% More formally, returns true if and only if this list contains at least one Node.
% ---------------------------------------------------------------------------------------
contains(_, List) when List#list.length =:= 0 ->
  false;
contains(Data, List) ->
  search_data(Data, List#list.head).

search_data(Data, Node) when Data =:= Node#node.data ->
  true;
search_data(_, Node) when Node#node.next =:= undefined ->
  false;
search_data(Data, Node) ->
  search_data(Data, Node#node.next).

% ---------------------------------------------------------------------------------------
% Gets the Nth Node from the list
% 
% @throw indexOutOfBoundsException - if the specified index is out of range (index < 0 || index >= size()).
% ---------------------------------------------------------------------------------------
nth(Index, List) when ((List#list.length < Index) or (Index < 0)) ->
  throw("indexOutOfBoundException");
nth(Index, List) ->
  nth(Index, 0, List#list.head).

nth(Index, Current, Node) when Index =:= Current ->
  Node;
nth(Index, Current, Node) ->
  % steps forward
  nth(Index, Current + 1, Node#node.next).

% ---------------------------------------------------------------------------------------
% Replaces the Node at the specified position in this list with the specified Node. 
%
% @throw indexOutOfBoundsException - if the specified index is out of range (index < 0 || index >= size()).
% ---------------------------------------------------------------------------------------
set(_, Index, List) when ((List#list.length < Index) or (Index < 0)) ->
  % if the specified position is larger than List length,
  % throw excpetion.
  throw("indexOutOfBoundException");
set(Data, Index, List) ->
  % replaces Node at the specified position.
  NewHead = insert_node(Data, Index, 0, List#list.head),
  NewLength = linkedlist:length(List) + 1,
  #list{head = NewHead, length = NewLength}.

set_node(Data, Index, Current, Node) when Index =:= Current ->
  % constructs the subsequent Node(s)
  #node{data = Data, next = Node};
set_node(Data, Index, Current, Node) ->
  % steps forward
  NextNode = insert_node(Data, Index, Current + 1, Node#node.next),
  Node#node{next = NextNode}.