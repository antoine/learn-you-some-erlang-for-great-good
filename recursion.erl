-module(recursion).
-compile([export_all]).

leng([]) -> 0;
leng([_|T]) -> 1+leng(T).

trlen([_|T]) -> trlen(T,1).

trlen([_|T], Len) -> trlen(T, Len+1);
trlen([],Len) -> Len.

tail_duplicate(N,Term) when N > 0 ->
  tail_duplicate(N,Term,[]).

tail_duplicate(0,_,List) -> List;
tail_duplicate(N,Term,List) -> tail_duplicate(N-1, Term, [Term|List]).

reverse(List) -> reverse(List, []).

reverse([], Result) -> Result;
reverse([X|T], Result) -> reverse(T, [X|Result]).

qsort([]) -> [];
qsort([Pivot|Rest]) ->
  {Smaller, Larger} = partition(Pivot, Rest, [], []),
  qsort(Smaller) ++ [Pivot] ++ qsort(Larger).

partition(_,[],Smaller, Larger) -> {Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) ->
  if H =< Pivot -> partition(Pivot, T, [H|Smaller], Larger); 
     H > Pivot -> partition(Pivot, T, Smaller, [H|Larger])
  end.
     
