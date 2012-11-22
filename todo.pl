todo(homework).  
todo(laundry).
todo(dishes).
todo(talk).

cannot_do(X) :-
  just_before(Y, X),
  todo(Y).

agenda(Agenda) :-
  findall(X, todo(X), Need_Doing),
  findall(X, cannot_do(X), Cannot_Do),
  subtract(Need_Doing, Cannot_Do, Agenda).

just_before(laundry, homework).
just_before(dishes, laundry).

before(X, Y) :- just_before(X, Y).
before(X, Y) :-
  just_before(X, T),
  before(T, Y).

tag(homework, work).
tag(laundry, home).
tag(dishes, home).
tag(talk, work).

agenda_tagged(Tag, Agenda) :-
  findall(X, tag(X, Tag), Need_Doing),
  findall(X, cannot_do(X), Cannot_Do),
  subtract(Need_Doing, Cannot_Do, Agenda).
