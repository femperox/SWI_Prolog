%------------------ Задание ------------------
% Аккинатор про животных!!!!!
%--------------- Конец задания ---------------

%-------------------------
% обозначаем какие предикаты будут динамическими, чтобы пополнять БЗ

:- dynamic small/2.
:- dynamic domestic/2.
:- dynamic real/2.
:- dynamic fangs/2.
:- dynamic hooves/2.
:- dynamic water/2.
:- dynamic wings/2.
:- dynamic bodyparts/2.
%-------------------------

%-------------------------
% для считывания текста фактов 

read_str(S):-
  get0(X),
  r_str(X,S,[]).
  
r_str(10,S,S):-!.

r_str(47,S,S):-!.

r_str(X,S,B):-
  append(B,[X],B1),
  get0(X1),
  r_str(X1,S,B1).
%-------------------------

%-------------------------
% для записи фактов

write_small(X,Y):-	
  repeat, 
  (small(X,Y) -> ( write(' '),write(X), 
				   nl, write(Y),
				   write("."),
				   retract(small(X,Y))) 
			  ;X=nil,Y=nil).
			  
write_domestic(X,Y):-	
  repeat, 
  (domestic(X,Y) -> (nl, write(Y),
					 write("."),
					 retract(domestic(X,Y))) 
			      ;X=nil,Y=nil).

write_real(X,Y):-	
  repeat, 
  (real(X,Y) -> (nl, write(Y),
				 write("."),
				 retract(real(X,Y))) 
			  ;X=nil,Y=nil).	

write_fangs(X,Y):-	
  repeat, 
  (fangs(X,Y) -> (nl, write(Y),
				  write("."),
				  retract(fangs(X,Y))) 
			  ;X=nil,Y=nil).

write_hooves(X,Y):-	
  repeat, 
  (hooves(X,Y) -> (nl, write(Y),
				   write("."),
				   retract(hooves(X,Y))) 
			   ;X=nil,Y=nil).	

write_water(X,Y):-	
  repeat, 
  (water(X,Y) -> (nl, write(Y),
				  write("."),
				  retract(water(X,Y))) 
			  ;X=nil,Y=nil).
			  
write_wings(X,Y):-	
  repeat, 
  (wings(X,Y) -> (nl, write(Y),
				  write("."),
				  retract(wings(X,Y))) 
			    ;X=nil,Y=nil).	

write_bodyparts(X,Y):-	
  repeat, 
  (bodyparts(X,Y) -> (nl, write(Y),
				      write("."),
				      retract(bodyparts(X,Y))) 
			      ;X=nil,Y=nil).	

write_new :-
  tell('D:/dz/_univer/Prolog/Prolog_inds/_7_facts.txt'),
  write_small(X,_),
  write_domestic(X,_),
  write_real(X,_),
  write_fangs(X,_),
  write_hooves(X,_),
  write_water(X,_),
  write_wings(X,_),
  write_bodyparts(X,_),
  X=nil,
  told.				  
%-------------------------

%-------------------------
% для считывания фактов

read_small(10, _):-!.

read_small(_, Animal_pred):-	
  read_str(Animal),
  name(Animal_pred,Animal),
  read(Y),
  asserta(small(Animal_pred,Y)),
  get0(Sym),
  read_small(Sym, Animal_pred).
  
read_domestic(10, _):-!.

read_domestic(_, Animal_pred):-	
  read(Y),
  asserta(domestic(Animal_pred,Y)),
  get0(Sym),
  read_domestic(Sym, Animal_pred).

read_real(10, _):-!.

read_real(_, Animal_pred):-	
  read(Y),
  asserta(real(Animal_pred,Y)),
  get0(Sym),
  read_real(Sym, Animal_pred).


read_fangs(10, _):-!.

read_fangs(_, Animal_pred):-	
  read(Y),
  asserta(fangs(Animal_pred,Y)),
  get0(Sym),
  read_fangs(Sym, Animal_pred).


read_hooves(10, _):-!.

read_hooves(_, Animal_pred):-	
  read(Y),
  asserta(hooves(Animal_pred,Y)),
  get0(Sym),
  read_hooves(Sym, Animal_pred).


read_water(10, _):-!.

read_water(_, Animal_pred):-	
  read(Y),
  asserta(water(Animal_pred,Y)),
  get0(Sym),
  read_water(Sym, Animal_pred).


read_wings(10, _):-!.

read_wings(_, Animal_pred):-	
  read(Y),
  asserta(wings(Animal_pred,Y)),
  get0(Sym),
  read_wings(Sym, Animal_pred).

read_bodyparts(10, _):-!.

read_bodyparts(_, Animal_pred):-	
  read(Y),
  asserta(bodyparts(Animal_pred,Y)),
  get0(Sym),
  read_bodyparts(Sym, Animal_pred). 
 
  
read_new(X) :-
  see('D:/dz/_univer/Prolog/Prolog_inds/ind_7/_7_fact.txt'),
  get0(Sym),
  read_small(Sym, Animal),
  read_domestic(Sym, Animal),
  read_real(Sym, Animal),
  read_fangs(Sym, Animal),
  read_hooves(Sym, Animal),
  read_water(Sym, Animal),
  read_wings(Sym, Animal),
  read_rus_name(Sym, Animal),
  read_bodyparts(Sym, Animal),
  read_picture(Sym,Animal),
  X= 'DONE',
  seen.


%-------------------------
%Ваше животное маленькое?
% 2 - может быть
% 1 - да
% 0 - нет

small(cat, 		  	1).
small(humster, 	  	1).
small(bear, 	  	0).
small(dog, 		  	2).
small(rat, 		  	1).
small(pig, 		  	2).
small(pischiha,   	1).
small(kabarga, 	  	0).
small(fox, 		  	2).
small(dinosaur,   	0).
small(parrot, 	  	1).
small(crocodile,  	0).
small(unicorn, 	  	0).
small(pickachu,   	1).
small(dragon, 	  	0).
small(flying_fish,	1).
small(sonic, 	  	2).
small(fly, 		  	1).
small(vampire_fish, 0).
small(frog, 	  	1).
small(godzilla,   	0).
small(lizard, 	  	2).
small(duck, 	  	1).
small(cow, 		  	0).
small(catdog, 	  	2).
small(cerberus,   	2).
small(gorinich,   	0).
small(narwhal,    	0).
small(sphinx, 	  	0).
small(kurama, 	  	0).
small(phoenix, 	  	0).
small(pegasus, 	  	0).
%-------------------------

%-------------------------
%Ваше животное домашнее?
% 2 - может быть
% 1 - да
% 0 - нет

domestic(cat, 		   1).
domestic(humster, 	   1).
domestic(bear, 	 	   0).
domestic(dog, 		   1).
domestic(rat, 		   2).
domestic(pig, 		   1).
domestic(pischiha,     0).
domestic(kabarga, 	   0).
domestic(fox, 		   0).
domestic(dinosaur,     0).
domestic(parrot, 	   2).
domestic(crocodile,    0).
domestic(unicorn, 	   0).
domestic(pickachu,     2).
domestic(dragon, 	   0).
domestic(flying_fish,  0).
domestic(sonic, 	   0).
domestic(fly, 		   0).
domestic(vampire_fish, 0).
domestic(frog, 	 	   0).
domestic(godzilla,     0).
domestic(lizard, 	   2).
domestic(duck, 	 	   1).
domestic(cow, 		   1).
domestic(catdog, 	   2).
domestic(cerberus,     0).
domestic(gorinich,     0).
domestic(narwhal,      0).
domestic(sphinx, 	   0).
domestic(kurama, 	   0).
domestic(phoenix, 	   0).
domestic(pegasus, 	   0).
%-------------------------

%-------------------------
%Ваше реальное?
% 3 - было таким
% 2 - может быть
% 1 - да
% 0 - нет

real(cat, 		   1).
real(humster, 	   1).
real(bear, 	 	   1).
real(dog, 		   1).
real(rat, 		   1).
real(pig, 		   1).
real(pischiha,     1).
real(kabarga, 	   1).
real(fox, 		   1).
real(dinosaur,     3).
real(parrot, 	   1).
real(crocodile,    1).
real(unicorn, 	   0).
real(pickachu,     0).
real(dragon, 	   2).
real(flying_fish,  1).
real(sonic, 	   0).
real(fly, 		   1).
real(vampire_fish, 1).
real(frog, 	 	   1).
real(godzilla,     0).
real(lizard, 	   1).
real(duck, 	 	   1).
real(cow, 		   1).
real(catdog, 	   0).
real(cerberus,     0).
real(gorinich,     0).
real(narwhal,      1).
real(sphinx, 	   0).
real(kurama, 	   0).
real(phoenix, 	   0).
real(pegasus, 	   0).
%-------------------------

%-------------------------
%У вашего животного есть клыки?
% 1 - да
% 0 - нет

fangs(cat, 		  	1).
fangs(humster, 	  	0).
fangs(bear, 	  	1).
fangs(dog, 		  	1).
fangs(rat, 		  	0).
fangs(pig, 		  	0).
fangs(pischiha,   	0).
fangs(kabarga, 	  	1).
fangs(fox, 		  	1).
fangs(dinosaur,   	1).
fangs(parrot, 	  	0).
fangs(crocodile,  	1).
fangs(unicorn, 		0).
fangs(pickachu, 	1).
fangs(dragon, 		1).
fangs(flying_fish,	0).
fangs(sonic, 	 	0).
fangs(fly, 		 	0).
fangs(vampire_fish, 1).
fangs(frog, 	  	0).
fangs(godzilla,   	1).
fangs(lizard, 	  	0).
fangs(duck, 	  	0).
fangs(cow, 		  	0).
fangs(catdog, 	  	1).
fangs(cerberus,   	1).
fangs(gorinich,   	1).
fangs(narwhal,    	0).
fangs(sphinx, 	  	1).
fangs(kurama, 	  	1).
fangs(phoenix, 	  	0).
fangs(pegasus, 	  	0).
%-------------------------

%-------------------------
%У вашего животного есть копыта?
% 1 - да
% 0 - нет

hooves(cat, 	  	 0).
hooves(humster,  	 0).
hooves(bear, 	   	 0).
hooves(dog, 	  	 0).
hooves(rat, 	  	 0).
hooves(pig, 	  	 1).
hooves(pischiha,  	 0).
hooves(kabarga,   	 1).
hooves(fox, 	  	 0).
hooves(dinosaur,  	 0).
hooves(parrot, 	  	 0).
hooves(crocodile, 	 0).
hooves(unicorn,  	 1).
hooves(pickachu,  	 0).
hooves(dragon, 	 	 0).
hooves(flying_fish,	 0).
hooves(sonic, 	     0).
hooves(fly, 	   	 0).
hooves(vampire_fish, 0).
hooves(frog, 	  	 0).
hooves(godzilla,  	 0).
hooves(lizard, 	  	 0).
hooves(duck, 	  	 0).
hooves(cow, 	  	 1).
hooves(catdog, 	  	 0).
hooves(cerberus,  	 0).
hooves(gorinich,  	 0).
hooves(narwhal,   	 0).
hooves(sphinx, 	  	 0).
hooves(kurama, 	  	 0).
hooves(phoenix,   	 0).
hooves(pegasus,   	 1).
%-------------------------


%-------------------------
%Ваше животное живёт в или возле водоёма?
% 2 - в
% 1 - возле
% 0 - нет

water(cat, 	   	  	0).
water(humster,    	0).
water(bear, 	  	0).
water(dog, 	   	  	0).
water(rat, 	  	  	0).
water(pig, 	  	  	0).
water(pischiha,   	0).
water(kabarga,    	0).
water(fox, 	   	  	0).
water(dinosaur,   	0).
water(parrot, 	  	0).
water(crocodile,  	1).
water(unicorn,    	0).
water(pickachu,   	0).
water(dragon, 	 	0).
water(flying_fish,	2).
water(sonic, 	  	0).
water(fly, 	   	 	0).
water(vampire_fish, 2).
water(frog, 	 	1).
water(godzilla,   	2).
water(lizard, 	  	0).
water(duck, 	  	1).
water(cow, 	   	  	0).
water(catdog, 	  	0).
water(cerberus,   	0).
water(gorinich,   	0).
water(narwhal,    	2).
water(sphinx, 	  	0).
water(kurama, 	  	0).
water(phoenix,    	0).
water(pegasus,    	0).
%-------------------------

%-------------------------
%Ваше животное имеет крылья?
% 2 - может быть
% 1 - да
% 0 - нет

wings(cat, 		  	0).
wings(humster, 	  	0).
wings(bear, 	  	0).
wings(dog, 		  	0).
wings(rat, 		  	0).
wings(pig, 		  	0).
wings(pischiha,   	0).
wings(kabarga, 	  	0).
wings(fox, 		  	0).
wings(dinosaur,   	2).
wings(parrot, 	  	1).
wings(crocodile,  	0).
wings(unicorn, 	  	0).
wings(pickachu,   	0).
wings(dragon, 	    1).
wings(flying_fish,  1).
wings(sonic, 	    0).
wings(fly, 		    1).
wings(vampire_fish, 0).
wings(frog, 	  	0).
wings(godzilla,   	0).
wings(lizard, 	  	0).
wings(duck, 	  	1).
wings(cow, 		  	0).
wings(catdog, 	  	0).
wings(cerberus,   	0).
wings(gorinich,   	1).
wings(narwhal,    	0).
wings(sphinx, 	  	1).
wings(kurama, 	  	0).
wings(phoenix, 	  	1).
wings(pegasus, 	  	1).
%-------------------------

%-------------------------
%У вашего животного может быть нестандартное количество частей тела?
% 2 - может быть
% 1 - да
% 0 - нет

bodyparts(cat, 	   	  	0).
bodyparts(humster,    	0).
bodyparts(bear, 	  	0).
bodyparts(dog, 	   	  	0).
bodyparts(rat, 	   	  	0).
bodyparts(pig, 	  	  	0).
bodyparts(pischiha,   	0).
bodyparts(kabarga,    	0).
bodyparts(fox, 	   	  	0).
bodyparts(dinosaur,   	0).
bodyparts(parrot, 	  	0).
bodyparts(crocodile,  	0).
bodyparts(unicorn,    	0).
bodyparts(pickachu,   	0).
bodyparts(dragon, 	  	0).
bodyparts(flying_fish,	0).
bodyparts(sonic, 	  	0).
bodyparts(fly, 	   	  	0).
bodyparts(vampire_fish, 0).
bodyparts(frog, 	  	0).
bodyparts(godzilla,   	0).
bodyparts(lizard, 	  	2).
bodyparts(duck, 	  	0).
bodyparts(cow, 	   	  	0).
bodyparts(catdog, 	  	1).
bodyparts(cerberus,   	1).
bodyparts(gorinich,   	1).
bodyparts(narwhal,    	0).
bodyparts(sphinx, 	  	0).
bodyparts(kurama, 	  	1).
bodyparts(phoenix,    	0).
bodyparts(pegasus,   	0).
%-------------------------



%-------------------------
% вопросы аккинатора

quest1(X1) :-
  write(" --------- Is your animal small?"),nl,
  write("[2] Maybe"),nl,
  write("[1] Yes"),nl,
  write("[0] No"),nl,
  write(' --------- Answer: '),
  read(X1).

quest2(X2) :-
  write(" --------- Is your animal domestic?"),nl,
  write("[2] Maybe"),nl,
  write("[1] Yes"),nl,
  write("[0] No"),nl,
  write(' --------- Answer: '),
  read(X2).

quest3(X3) :-
  write(" --------- Is your animal real?"),nl,
  write("[3] It was"),nl,
  write("[2] Maybe"),nl,
  write("[1] Yes"),nl,
  write("[0] No"),nl,
  write(' --------- Answer: '),
  read(X3).
  
quest4(X4) :-
  write(" --------- Does your animal have fangs?"),nl,
  write("[1] Yes"),nl,
  write("[0] No"),nl,
  write(' --------- Answer: '),
  read(X4).
  
quest5(X5) :-
  write(" --------- Does your animal have hooves?"),nl,
  write("[1] Yes"),nl,
  write("[0] No"),nl,
  write(' --------- Answer: '),
  read(X5).
  
quest6(X6) :-
  write(" --------- Does your animal live in or near water?"),nl,
  write("[2] In"),nl,
  write("[1] Near"),nl,
  write("[0] No"),nl,
  write(' --------- Answer: '),
  read(X6).
  
quest7(X7) :-
  write(" --------- Does your animal have wings?"),nl,
  write("[2] Maybe"),nl,
  write("[1] Yes"),nl,
  write("[0] No"),nl,
  write(' --------- Answer: '),
  read(X7).  
  
quest8(X8) :-
  write(" --------- Does your animal have unusual amount of bodyparts?"),nl,
  write("[2] Maybe"),nl,
  write("[1] Yes"),nl,
  write("[0] No"),nl,
  write(' --------- Answer: '),
  read(X8).
%-------------------------

%-------------------------
% Мейн

main :-
  quest1(X1), nl, quest2(X2), nl, quest3(X3), nl, quest4(X4),
  quest5(X5), nl, quest6(X6), nl, quest7(X7), nl, quest8(X8),
  
  small(X, X1),  domestic(X, X2),
  real(X, X3),   fangs(X, X4),
  hooves(X, X5), water(X, X6),
  wings(X, X7),  bodyparts(X, X8),
  
  nl,
  write('Your animal is '),
  writeln(X).
  
  
%-------------------------
  
  