%%%-------------------------------------------------------------------
%%“Part One
%%Create a file named phone_records.hrl that defines a record with these fields:
%%Phone number
%%Starting date (month, day, and year)
%%Starting time (hours, minutes, and seconds)
%%End date (month, day, and year)
%%End time (hours, minutes, and seconds)
%%You may name the record whatever you wish, and you may use any field names you wish.
%%Part Two
%%In a module named phone_ets, create an ETS table for phone calls by reading a file. The function that does this will be named setup/1, and its argument will be the name of the file containing the data.”
%%
%%“Copy the following text into a file named call_data.csv and save the file in the same directory where you did part one.
%%650-555-3326,2013-03-10,09:01:47,2013-03-10,09:05:11
%%415-555-7871,2013-03-10,09:02:20,2013-03-10,09:05:09
%%729-555-8855,2013-03-10,09:00:55,2013-03-10,09:02:18
%%729-555-8855,2013-03-10,09:02:57,2013-03-10,09:03:56
%%213-555-0172,2013-03-10,09:00:59,2013-03-10,09:03:49
%%946-555-9760,2013-03-10,09:01:20,2013-03-10,09:03:10
%%301-555-0433,2013-03-10,09:01:44,2013-03-10,09:04:06
%%301-555-0433,2013-03-10,09:05:17,2013-03-10,09:07:53
%%301-555-0433,2013-03-10,09:10:05,2013-03-10,09:13:14
%%729-555-8855,2013-03-10,09:04:40,2013-03-10,09:07:29
%%213-555-0172,2013-03-10,09:04:26,2013-03-10,09:06:00
%%213-555-0172,2013-03-10,09:06:59,2013-03-10,09:10:35
%%946-555-9760,2013-03-10,09:03:36,2013-03-10,09:04:23
%%838-555-1099,2013-03-10,09:00:43,2013-03-10,09:02:44
%%650-555-3326,2013-03-10,09:05:48,2013-03-10,09:09:08
%%838-555-1099,2013-03-10,09:03:43,2013-03-10,09:06:26
%%838[…]”
%%
%%“Part Three
%%Write functions to summarize the number of minutes for a single phone number (summary/1) or for all phone numbers. (summary/0). These functions return a list of tuples in the form:
%%[{phoneNumber1, minutes]},{phoneNumber2, minutes}, …]
%%You could write your own code to do time and date calculations to figure out the duration of a phone call, but there’s a limit on how much you really want to re-invent the wheel, especially with something as complex as calendar calculations. Consider, for example, a call that begins on 31 December 2013 at 11:58:36 p.m. and ends on 1 January 2014 at 12:14:22 p.m. I don’t even want to think about calls that start on 28 February and go to the next day.
%%So, instead, use the calendar:datetime_to_gregorian_seconds/1 function to convert a date and time to the number of seconds since the year zero. (I swear I am not making this up.) The argument to this function is a tuple in the form:
%%{{year, month, day}, {hours, minutes, seconds}} %% for example
%%{{2013, 07, 14}, {14, 49, 21}}
%%Round up any number of seconds to the next minute for ech call. Thus, if[…]”
%%
%%%-------------------------------------------------------------------
-module(phone_ets).
-export([setup/1, summary/0, summary/1]).
-include("phone_records.hrl").

%% @doc Create an ets table of phone calls from the given file name.

-spec(setup(string()) -> atom()).

setup(FileName) ->

  %% If the table exists, delete it
  case ets:info(call_table) of


    undefined -> false;
    _ -> ets:delete(call_table)
  end,

  %% and create it anew
  ets:new(call_table, [named_table, bag,
                       {keypos, #phone_call.phone_number}]),

  {ResultCode, InputFile} = file:open(FileName, [read]),
  case ResultCode of
    ok -> read_item(InputFile);
    _ -> io:format("Error opening file: ~p~n", [InputFile])
  end.

%% Read a line from the input file, and insert its contents into
%% the call_table. This function is called recursively until end of file

-spec(read_item(file:io_device()) -> atom()).

read_item(InputFile) ->
  RawData = io:get_line(InputFile, ""),
  if
    is_list(RawData) ->
      Data = string:strip(RawData, right, $\n),
      [Number, SDate, STime, EDate, ETime] =
        re:split(Data, ",", [{return, list}]),
      ets:insert(call_table, #phone_call{phone_number = Number,
                                         start_date   = to_date(SDate), start_time = to_time(STime),


                                         end_date     = to_date(EDate), end_time = to_time(ETime)}),
      read_item(InputFile);
    RawData == eof -> ok
  end.

%% @doc Convert a string in form "yyyy-mm-dd" to a tuple {yyyy, mm, dd}
%% suitable for use with the calendar module.

-spec(to_date(string()) -> {integer(), integer(), integer()}).

to_date(Date) ->
  [Year, Month, Day] = re:split(Date, "-", [{return, list}]),
  [{Y, _}, {M, _}, {D, _}] = lists:map(fun string:to_integer/1,
                                       [Year, Month, Day]),
  {Y, M, D}.

%% @doc Convert a string in form "hh:mm:ss" to a tuple {hh, mm, ss}
%% suitable for use with the calendar module.

-spec(to_time(string()) -> {integer(), integer(), integer()}).

to_time(Time) ->
  [Hour, Minute, Second] = re:split(Time, ":", [{return, list}]),
  [{H, _}, {M, _}, {S, _}] = lists:map(fun string:to_integer/1,
                                       [Hour, Minute, Second]),
  {H, M, S}.


%% @doc Create a summary of number of minutes used by all phone numbers.

-spec(summary() -> [tuple(string(), integer())]).

summary() ->
  FirstKey = ets:first(call_table),
  summary(FirstKey, []).

summary(Key, Result) ->
  NextKey = ets:next(call_table, Key),
  case NextKey of
    '$end_of_table' -> Result;
    _ -> summary(NextKey, [hd(summary(Key)) | Result])
  end.

%% @doc Create a summary of number of minutes used by one phone number.

-spec(summary(string()) -> [tuple(string(), integer())]).

summary(PhoneNumber) ->
  Calls = ets:lookup(call_table, PhoneNumber),
  Total = lists:foldl(fun subtotal/2, 0, Calls),
  [{PhoneNumber, Total}].

subtotal(Item, Accumulator) ->
  StartSeconds = calendar:datetime_to_gregorian_seconds(
    {Item#phone_call.start_date, Item#phone_call.start_time}),

  EndSeconds = calendar:datetime_to_gregorian_seconds(
    {Item#phone_call.end_date, Item#phone_call.end_time}),
  Accumulator + ((EndSeconds - StartSeconds + 59) div 60).


