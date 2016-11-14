%%%-------------------------------------------------------------------
%%Write a module named bank that contains a function account/1.
%%The function takes a numeric Balance,
%%which gives the current balance in the account in imaginary dollars.
%%The function will repeatedly ask for a transaction (deposit, withdraw, balance inquiry, or quit).
%%If a deposit or withdrawal, it asks for the amount to deposit or withdraw, and then does that transaction.
%%If a deposit is more than $10,000, the deposit may be subject to hold.
%%Provide output to the customer, and also use error_logger to write to a log file
%%(which, in this case, will go to your terminal).
%%Choose any form of input prompts and feedback and logging messages that you deisre.
%%Handle the following situtations:
%%Deposits and withdrawals cannot be negative numbers (error)
%%Deposits of $10,000 or more might be subject to hold (warning)
%%All other transactions are successful (informational)
%%Use get_number/1 from Étude 5-1 to allow either integer or float input.
%%Here is sample output. Due to Erlang’s asynchronous nature,
%%the user prompts and logging are often interleaved in the most inconvenient places.”

%%%-------------------------------------------------------------------
-module(bank).
-export([account/1]).

-spec(account(pid()) -> number()).

%% @doc create a client and give it the process ID for an account
account(Balance) ->
  Input = io:get_line("D)eposit, W)ithdraw, B)alance, Q)uit: "),
  Action = hd(Input),

  case Action of
    $D ->
      Amount = get_number("Amount to deposit: "),
      _NewBalance = transaction(deposit, Balance, Amount);
    $W ->
      Amount = get_number("Amount to withdraw: "),
      _NewBalance = transaction(withdraw, Balance, Amount);

    $B ->
      _NewBalance = transaction(balance, Balance);
    $Q ->
      _NewBalance = Balance;
    _ ->
      io:format("Unknown command ~c~n", [Action]),
      _NewBalance = Balance
  end,
  if
    Action /= $Q ->
      account(_NewBalance);
    true -> true
  end.


%% @doc Present a prompt and get a number from the
%% user. Allow either integers or floats.
get_number(Prompt) ->
  Str = io:get_line(Prompt),
  {Test, _} = string:to_float(Str),
  case Test of
    error -> {N, _} = string:to_integer(Str);
    _ -> N = Test
  end,
  N.

transaction(Action, Balance, Amount) ->
  case Action of
    deposit ->
      if
        Amount >= 10000 ->
          error_logger:warning_msg("Excessive deposit ~p~n", [Amount]),
          io:format("Your deposit of $~p may be subject to hold.", [Amount]),
          io:format("Your new balance is ~p~n", [Balance + Amount]),
          NewBalance = Balance + Amount;
        Amount < 0 ->
          error_logger:error_msg("Negative deposit amount ~p~n", [Amount]),
          io:format("Deposits may not be less than zero."),
          NewBalance = Balance;
        Amount >= 0 ->
          error_logger:info_msg("Successful deposit ~p~n", [Amount]),
          NewBalance = Balance + Amount,
          io:format("Your new balance is ~p~n", [NewBalance])
      end;
    withdraw ->
      if
        Amount > Balance ->
          error_logger:error_msg("Overdraw ~p from balance ~p~n", [Amount,
                                                                   Balance]),
          io:format("You cannot withdraw more than your current balance of ~p.~n",
                    [Balance]),
          NewBalance = Balance;
        Amount < 0 ->
          error_logger:error_msg("Negative withdrawal amount ~p~n", [Amount]),
          io:format("Withdrawals may not be less than zero."),
          NewBalance = Balance;
        Amount >= 0 ->
          error_logger:info_msg("Successful withdrawal ~p~n", [Amount]),
          NewBalance = Balance - Amount,
          io:format("Your new balance is ~p~n", [NewBalance])
      end
  end,
  NewBalance.

transaction(balance, Balance) ->
  error_logger:info_msg("Balance inquiry ~p~n", [Balance]),
  Balance.