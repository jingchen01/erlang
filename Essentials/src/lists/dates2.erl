%%%-------------------------------------------------------------------
%%Add a function julian/1 to the dates module. Given a string in ISO format ("yyyy-mm-dd"),
%% it returns the Julian date: the day of the year.
%%Here is some sample output.
%%1> c(dates).
%%{ok,dates}
%%2> dates:julian("2012-12-31").
%%366
%%3> dates:julian("2013-12-31").
%%365
%%4> dates:julian("2012-02-05").
%%36
%%5> dates:julian("2013-02-05").
%%36
%%6> dates:julian("1900-03-01").
%%60
%%7> dates:julian("2000-03-01").
%%61
%%126> dates:julian("2013-01-01").
%%1
%%The julian/1 function defines a 12-item list called DaysPerMonth that contains the number of days in each month, 
%%splits the date into the year, month, and day (using the date_parts/1 function you wrote in Étude 5-2, 
%%and then calls helper function julian/5 (yes, 5).
%%The julian/5 function does all of the work. Its arguments are the year, month, day, the list of days per month, 
%%and an accumulated total, which starts at zero. julian/5 takes 
%%
%%
%%the head of the days per month list and adds it to the accumulator,
%% and then calls julian/5 again with the tail of the days
%% per month list and the accumulator value as its last two arguments.
%%Let’s take, as an example, the sequence of calls for April 18, 2013:
%%julian(2013, 4, 18, [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], 0).
%%julian(2013, 4, 18, [28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], 31).
%%julian(2013, 4, 18, [31, 30, 31, 30, 31, 31, 30, 31, 30, 31], 59).
%%julian(2013, 4, 18, [30, 31, 30, 31, 31, 30, 31, 30, 31], 90).
%%At this point, the accumulator has all the days up through the beginning of April, 
%%so the last call to julian/5 just adds the 18 remaining days and yields 108 as its result.
%%You know you are doing the last call when you have used up the first month-1 items in the list of days per month. 
%%That happens when the month number is greater than (13 - length(days_per_month_list)).
%%Of course, there’s still the problem of leap years. For non-leap years, the last[…]


%%%-------------------------------------------------------------------

-module(dates2).
-export([date_parts/1, julian/1, is_leap_year/1]).

%% @doc Takes a string in ISO date format (yyyy-mm-dd) and
%% returns a list of integers in form [year, month, day].

-spec(date_parts(list()) -> list()).

date_parts(DateStr) ->
  [YStr, MStr, DStr] = re:split(DateStr, "-", [{return, list}]),
  [element(1, string:to_integer(YStr)),
    element(1, string:to_integer(MStr)),
    element(1, string:to_integer(DStr))].

%% @doc Takes a string in ISO date format (yyyy-mm-dd) and
%% returns the day of the year (Julian date).

-spec(julian(string()) -> integer()).

julian(DateStr) ->
  DaysPerMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
  [Y, M, D] = date_parts(DateStr),
  julian(Y, M, D, DaysPerMonth, 0).

%% @doc Helper function that recursively accumulates the number of days
%% up to the specified date.

-spec(julian(integer(), integer(), integer(), [integer()], integer) -> integer()).

julian(Y, M, D, MonthList, Total) when M > 13 - length(MonthList) ->
  [ThisMonth | RemainingMonths] = MonthList,
  julian(Y, M, D, RemainingMonths, Total + ThisMonth);

julian(Y, M, D, _MonthList, Total) ->
  case M > 2 andalso is_leap_year(Y) of
    true -> Total + D + 1;
    false -> Total + D
  end.

%% @doc Given a year, return true or false depending on whether
%% the year is a leap year.

-spec(is_leap_year(integer()) -> boolean()).

is_leap_year(Year) ->
  (Year rem 4 == 0 andalso Year rem 100 /= 0)
    orelse (Year rem 400 == 0).


