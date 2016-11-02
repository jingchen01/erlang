%%%-------------------------------------------------------------------
%%1.02 (*) Find the last but one element of a list.
%%( the last but one: penultimate)
%%%-------------------------------------------------------------------
-module(p02).
-author("chen_j").

%% API
-export([penultimate/1]).

penultimate([]) -> "undefined";
penultimate([_ | []]) -> "undefined";
penultimate([P, _ | []]) -> P;
penultimate([_, S | T]) -> penultimate([S | T]).


%%Test:
%%21> c(p02).
%%{ok,p02}
%%22> p02:penultimate([]).
%%"undefined"
%%23> p02:penultimate([A]).
%%* 1: variable 'A' is unbound
%%24> p02:penultimate([1]).
%%"undefined"
%%25> p02:penultimate([a]).
%%"undefined"
%%26> p02:penultimate(['A']).
%%"undefined"
%%27> p02:penultimate([1,2]).
%%1
%%28> p02:penultimate([1,2,3]).
%%2
