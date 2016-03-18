-module(cases).
-compile([export_all]).

insert(X,[]) ->
  [X];
insert(X,Set) when is_list(Set)->
  case lists:member(X,Set) of
    true -> Set;
    false -> [X|Set]
  end.

beach(Temperature) ->
  case Temperature of
    {celsius, N} when N >= 20, N =< 45 ->
      'favorable';
    {kelvin, N} when N >= 293, N =< 318 ->
      'scienfitically favorable';
    {fahrenheit, N} when N >= 68, N =< 113 ->
      'fahrenheit in the US';
    _ ->
      'avoid beach'
  end.

