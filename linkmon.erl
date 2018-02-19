-module(linkmon).
-compile(export_all).


start_critic() ->
  spawn(?MODULE, restarter, []).

restarter() ->
  process_flag(trap_exit, true),
  Pid = spawn_link(?MODULE, critic, []),
  register(critic, Pid),
  receive
    {'EXIT', Pid, normal} -> 
      ok;
    {'EXIT', Pid, shutdown} -> 
      ok;
    {'EXIT', Pid, _} -> 
      restarter()
  end.


judge(Band, Album) ->
  Ref = make_ref(),
  critic ! {self(), Ref, {Band, Album}},
  receive
    {Ref, Criticism} -> Criticism
  after 2000 ->
          timeout
  end.

critic() ->
  receive
    {From, Ref, {"rage", "unit testify"}} ->
      From ! {Ref, "great"};
    {From, Ref, {"system of a down", "crash"}} ->
      From ! {Ref, "not sot great"};
    {From, Ref, {"johnny crash", "ring of fire"}} ->
      From ! {Ref, "incredible"};
    {From, Ref, {_Band, _Album}} ->
      From ! {Ref, "terrible"}
  end,
  critic().

chain(0) ->
  receive
    _ -> ok
  after 2000 ->
          exit("chain dies here")
  end;
chain(N) ->
  spawn_link(fun() -> chain(N-1) end),
  receive
    _ -> ok
  end.
trapped_chain(N) ->
  process_flag(trap_exit, true),
  spawn_link(fun() -> chain(N-1) end),
  receive
    R -> R
  end.
