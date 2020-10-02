%------------------ Задание ------------------
% Для введённого списка чисел>0 построить список всех
% простых делителей >0 без повторений
%--------------- Конец задания ---------------


%-------------------------
% читаем список А длины N
readlist([],0) :-!.

readlist([H|List],N):-
	read(H),
	N1 is N-1,
	readlist(List,N1).

%-------------------------
% выводит список А длины N
writelist([]):-!.

writelist([H|T]):-
		write(H),
		write("  "),
		writelist(T).

%-------------------------

%-------------------------
% простота числа

%Двойка простое число
prost(2):-!.

%Нет смысла смотреть все чётные числа. Смотрим нечётные
prost(X):-
  0 =\= X mod 2,
  prost(X,3).

%Число делится только само на себя  
prost(X,X):- !.

%Проход по всем нечётным числам
%Если делится на какое-то число < него, то непростое
prost(X,K):-
	0 =\= X mod K,
	K1 is K+2,
	prost(X,K1).
%-------------------------

%-------------------------
%Составляем список простых делителей 

%Основной предикат, из которого вызываем главный поиск
find_Delitel(X,Del,List):- find_Delitel(X,Del,[],List).

%Смысла смотреть 1 нет, она не простая
find_Delitel(1,_,[],[]) :-!.

%Когда у числа закончились делители
find_Delitel(X,Del,[H|T],[H|T]):- Del>X.

%Когда число и делитель и простое, то добавляем в список
find_Delitel(X,Del,List1,List) :-
  Zero is X mod Del,
  Zero == 0, prost(Del),
  append(List1,[Del],List2), % [Del] - пушо список из одного элемента
  Del1 is Del+1,
  find_Delitel(X,Del1,List2,List).

%Иначе перескакиваем на след. число
find_Delitel(X,Del,List1,List):-
  Del1 is Del+1,
  find_Delitel(X,Del1,List1,List).
%-------------------------



%-------------------------
% принадлежит ли элемент списку?
in_(H,[H|_]) :- !.

in_(H,[_|T]) :- in_(H,T).
%-------------------------


%-------------------------
% Объединение списков в список без повторяющихся элов

%Если пустой список, то объединять нечего
union1([], List, List):-!.

%Смотрим есть ли элемент в списке
%Если есть, то смотрим дальше
union1([H|T], List, AppendTail):-
	in_(H, List), !,
	union1(T, List, AppendTail).

%Если нет, то просто присоединяем 
union1([H|T], List, [H|AppendTail]):-
	union1(T, List, AppendTail).
%-------------------------

%-------------------------
%Составляем список простых делителей (неповторяющийся) 

%Основной предикат, из которого вызываем главный поиск
check([H|T], ResultList) :-
 check([H|T], [], ResultList).

%Если смотреть не от чего, то значит поиск завершился
check([], List, List) :- !.

%Ищем для каждого элемента список простых делителей
%Делаем пересечение списков делителей и смотрим дальше
check([H|T], ResultList1, List) :-
  find_Delitel(H,2,ResultList),
  union(ResultList1, ResultList, NewResultList),
  check(T,NewResultList, List),
  !.
%-------------------------

%-------------------------  
%Мейн
main :-
 write("Enter length of list: "),
 read(N),
 write("Enter list: "),
 readlist(A,N),
 check(A,ResultList),
 write("Result list: [ "),
 writelist(ResultList),
 write("]"),
 !.
%-------------------------










