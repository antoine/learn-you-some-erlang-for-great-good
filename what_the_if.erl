-module(what_the_if).
-compile([export_all]).

heh_fine() ->
  if 1 =:= 1 ->
       works
  end,
  if 1 =:=2; 1 =:= 1 ->
       works
  end,
  if 1 =:=2, 1 =:= 1 ->
       fails
  end.

oh_god(N) ->
  if N =:= 2 -> might_succeed;
     true -> always_does
  end.

help_me(Animal) ->
  Talk = if Animal == cat -> "meow";
            Animal == beef -> "mooo";
            Animal == dog -> "arf";
            Animal == tree -> "bark";
            true -> "dfgafgad"
         end,
  {Animal, "says "++Talk ++"!"}.
