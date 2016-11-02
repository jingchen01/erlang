%%%-------------------------------------------------------------------
%%1.06 (*) Find out whether a list is a palindrome.
%%A palindrome can be read forward or backward; e.g. [x,a,m,a,x].
%%%-------------------------------------------------------------------
-module(p06).
-author("chen_j").

%% API
-export([is_palindrome/1]).

is_palindrome([]) -> true;
is_palindrome([_ | []]) -> true;
is_palindrome(L) -> lists:reverse(L) == L.

%%Note:
%%X > Y X is greater than Y.
%%X < Y X is less than Y.
%%X =< Y X is equal to or less than Y.
%%X >= Y X is greater than or equal to Y.
%%X == Y X is equal to Y.
%%X /= Y X is not equal to Y.
%%X =:= Y X is identical to Y.
%%X =/= Y X is not identical to Y.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%Test:
%%99> c(p06).
%%{ok,p06}
%%100> p06:is_palindrome([]).
%%true
%%101> p06:is_palindrome([1,2]).
%%false
%%102> p06:is_palindrome([1,2,3]).
%%false
%%103> p06:is_palindrome([1,2,1]).
%%true
%%104> p06:is_palindrome([1,2,5,2]).
%%false
%%105> p06:is_palindrome([1,2,5,2,1]).
%%true
%%106> p06:is_palindrome([1,2,5,2,1,1]).
%%false
