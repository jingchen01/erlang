-module(dolphins).
-compile(export_all).

dolphin1() ->
  receive
    do_a_flip ->
      io:format("How about no?~n");
    fish ->
      io:format("So long and thanks for all the fish!~n");
    _ ->
      io:format("Heh, we're smarter than you humans.~n")
  end.

dolphin2() ->
  receive
    {From, do_a_flip} ->
      From ! "How about no?";
    {From, fish} ->
      From ! "So long and thanks for all the fish!";
    _ ->
      io:format("Heh, we're smarter than you humans.~n")
  end.

dolphin3() ->
  receive
    {From, do_a_flip} ->
      From ! "How about no?",
      dolphin3();
    {From, fish} ->
      From ! "So long and thanks for all the fish!";
    _ ->
      io:format("Heh, we're smarter than you humans.~n"),
      dolphin3()
  end.


%%Test:
%%14> c(dolphins).
%%{ok,dolphins}
%%15> Dolphin = spawn(dolphins, dolphin1, []).
%%<0.83.0>
%%16> Dolphin ! "oh, hello dolphin!".
%%Heh, we're smarter than you humans.
%%"oh, hello dolphin!"
%%17> Dolphin ! fish
%%fish
%%18>
%%18> f(Dolphin).
%%ok
%%19> Dolphin = spawn(dolphins, dolphin1, []).
%%<0.89.0>
%%20> Dolphin ! fish.
%%So long and thanks for all the fish!
%%fish
%%21>
%%21> Dolphin2 = spawn(dolphins, dolphin2, []).
%%<0.92.0>
%%22> Dolphin2 ! {self(), do_a_flip}.
%%{<0.57.0>,do_a_flip}
%%23> flush().
%%Shell got "How about no?"
%%ok
%%24> Dolphin3 = spawn(dolphins, dolphin3, []).
%%<0.96.0>
%%25> Dolphin3 ! Dolphin3 ! {self(), do_a_flip}.
%%{<0.57.0>,do_a_flip}
%%26> flush().
%%Shell got "How about no?"
%%Shell got "How about no?"
%%ok
%%27> Dolphin3 ! {self(), unknown_message}.
%%Heh, we're smarter than you humans.
%%{<0.57.0>,unknown_message}
%%29> Dolphin3 ! Dolphin3 ! {self(), fish}.
%%{<0.57.0>,fish}
%%30> flush().
%%Shell got "So long and thanks for all the fish!"
%%ok
