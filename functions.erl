-module(functions).
-compile([export_all]).

head([H|_]) -> H.

%second([_|T]) -> head(T).
second([_,T|_]) -> T.
