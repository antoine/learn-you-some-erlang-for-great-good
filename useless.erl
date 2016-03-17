-module(useless).
-export([add/2, hello/0, greet_and_add_two/1]).
-compile([debug_info, export_all]).
-define(HOUR, 3600). %in seconds

-define(sub(X,Y), X-Y).

add(A,B) ->
  A + B.

sub(A,B) ->
  ?sub(B,A).

hello() ->
  io:format("Hello you~n").

greet_and_add_two(X) ->
  hello(),
  add(X,2).
