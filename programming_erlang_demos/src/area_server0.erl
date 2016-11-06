-module(area_server0).
-export([loop/0]).
loop() ->
  receive
    {rectangle, Width, Ht} ->
      io:format("Area of rectangle is ~p~n", [Width * Ht]),
      loop();
    {square, Side} ->
      io:format("Area of square is ~p~n", [Side * Side]),
      loop();
    {triangle, Side1, Side2, Side3} ->
      S = (Side1 + Side2 + Side3) / 2,
      Area = math:sqrt(S * (S - Side1) * (S - Side2) * (S - Side3)),
      io:format("Area of triangle is ~p~n", [Area]),
      loop()
  end.