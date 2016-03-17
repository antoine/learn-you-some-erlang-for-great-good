-module(useless).

-compile([export_all]).

greet(male, Name) ->
  io:format("Hello Mr. ~s", [Name]);
greet(female, Name) ->
  io:format("Hello Mrs. ~s", [Name]);
greet(_, Name) ->
  io:format("Hello ~s", [Name]).

