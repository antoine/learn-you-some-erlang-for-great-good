-module(kitchen).
-compile(export_all).

fridge1() ->
  receive
    {From, {store, _Food}} ->
      From ! {self(), ok},
      fridge1();
    {From, {take, _Food}} ->
      %% uh...
      From ! {self(), not_found},
      fridge1();
    terminate ->
      ok
  end.

start(Foodlist) ->
  spawn(?MODULE, fridge2, [Foodlist]).

fridge2(Foodlist) ->
  receive
    {From, {store, Food}} ->
      From ! {self(), ok},
      fridge2([Food|Foodlist]);
    {From, {take, Food}} ->
      case lists:member(Food, Foodlist) of
        true ->
          From ! {self(), {ok, Food}},
          fridge2(lists:delete(Food, Foodlist));
        false ->
          From ! {self(), not_found},
          fridge2(Foodlist)
      end;
    terminate ->
      ok
  end.

store(Pid, Food) ->
  Pid ! {self(), {store, Food}},
  receive
    {Pid, Msg} -> Msg
  end.

take(Pid, Food) ->
  Pid ! {self(), {take, Food}},
  receive 
    {Pid, Msg} -> Msg
  end.
