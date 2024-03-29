%------------------ Задание ------------------
%Три друга – Петр, Роман и Сергей учатся на математическом, 
%физическом и химическом факультетах университета. 
% 1.Если Петр математик, то Сергей не физик. 
% 2.Если Роман не физик, то Петр – математик. 
% 3.Если Сергей не математик, то Роман – химик.
%Где учится Роман?
%--------------- Конец задания ---------------

%-------------------------
%Инициализация факультетов...
facult(physicist).
facult(chemist).
facult(mathematician).
%-------------------------

%-------------------------
% выполнение первого условия.
% 1.Если Петр математик, то Сергей не физик.

% Если первый студент - математик, то второй не физик
condition_1(Student1, Student2) :-
  Student1 = mathematician,
  not(Student2 = physicist).
  
% В другом случае первый студент не математик
condition_1(Student1, _) :-
  not(Student1 = mathematician).
%-------------------------

%-------------------------  
% выполнение второго условия.
% 2.Если Роман не физик, то Петр – математик.

% Если первый студент не физик, то второй математик
condition_2(Student1, Student2) :-
  not(Student1 = physicist),
  Student2 = mathematician.

% В другом случае он физик
condition_2(physicist, _).
%-------------------------

%-------------------------
% выполнение третьего условия.
% 3.Если Сергей не математик, то Роман – химик.

%Если первый студент не математик, то второй химик 
condition_3(Student1, Student2) :-
  not(Student1 = mathematician),
  Student2 = chemist.
  
%иначе он математик
condition_3(mathematician, _).
%-------------------------


%-------------------------

%предикат для решения поставленной задачи
%сначала делаем начальную инициализацию так,
%чтобы у каждого студента был рандомный факультет ( не повторяются )
%далее пробегаем по каждому условию
solve(Student1, Student2, Student3) :-
  
  facult(Student1),
  facult(Student2),
  facult(Student3),
 
  not(Student1 = Student2),
  not(Student1 = Student3),
  not(Student2 = Student3),
  
  condition_1(Student1, Student3),
  condition_2(Student2, Student1),
  condition_3(Student3, Student2).
%-------------------------

%-------------------------
%мейн для основной проги  
main :-
  solve(Petr, Roman, Sergey),
  write("Roman is "),
  write(Roman), 
  !.
%-------------------------


  
  
  