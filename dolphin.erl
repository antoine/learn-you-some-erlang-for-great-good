-module(dolphin).
-compile(export_all).

dolphin1() ->
  receive
    do_a_flip ->
      io:format("how about no?~n");
    fish ->
      io:format("So long!~n");
    _ -> 
      io:format("Heh, smartass!~n")
  end.

dolphin2() ->
  receive
    {From, do_a_flip} -> 
      From ! "how about no?~n";
    {From, fish }->
      From ! "So long!~n";
    _ -> 
      io:format("Heh, smartass!~n")
  end.



