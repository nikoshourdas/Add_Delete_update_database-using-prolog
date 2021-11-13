
% kanones

/*1*/
rule(id(1),values(OxygenPercentage,[Oligochaeta,Izimata ,H2S,CH4,UnderLayer,WaterScent]),Answer) :-
    number(OxygenPercentage) ,
    OxygenPercentage >= 0.2 ,
    Answer = "Κανενα προβλημα Ανοξιας" .
/*2*/
rule(id(2),values(OxygenPercentage, [NO3,Oligochaeta,Izima,H2S,CH4,UnderLayer,WaterScent]),Answer):-
    number(OxygenPercentage),
    PercentageNo < 0.2,
    NO3 = yes,
    Answer = 'Σοβαρο προβλημα ανοξιας.'.

/*3*/
rule(id(3),values(OxygenPercentage, [NO3,Oligochaeta,Izima,H2S,CH4,UnderLayer,WaterScent]),Answer):-
		number(OxygenPercentage),
    PercentageNo < 0.2,
    NO3 = no,
		Answer = 'Πολυ Σοβαρο προβλημα ανοξιας.'.

/*4*/
rule(id(4),values(no, [NO3,Oligochaeta,Izima,H2S,CH4,UnderLayer,WaterScent]),Answer):-
		Oligochaeta = no,
    Izima = skoura,
    H2S = yes,
		Answer = 'Πολυ Σοβαρο προβλημα ανοξιας.'.

/*5*/
rule(id(5),values(no, [NO3,Oligochaeta,Izima,H2S,CH4,UnderLayer,WaterScent]),Answer):-
		Oligochaeta = no,
    Izima = skoura,
    H2S = no,
    CH4 = yes,
		Answer = 'Πολυ Σοβαρο προβλημα ανοξιας.'.

/*6*/
rule(id(6),values(no, [NO3,Oligochaeta,Izima,H2S,CH4,UnderLayer,WaterScent]),Answer):-
		Oligochaeta = no,
    Izima = skoura,
    H2S = no,
    CH4 = no,
		Answer = 'Σοβαρο προβλημα ανοξιας.'.

/*7*/
rule(id(7),values(no, [NO3,Oligochaeta,Izima,H2S,CH4,UnderLayer,WaterScent]),Answer):-
		Oligochaeta = no,
    Izima = anoixta,
    UnderLayer = big,
  	Answer = 'Κανενα προβλημα ανοξιας.'.

/*8*/
rule(id(8),values(no, [NO3,Oligochaeta,Izima,H2S,CH4,UnderLayer,WaterScent]),Answer):-
  	Oligochaeta = no,
    Izima = anoixta,
    UnderLayer = middle,
		Answer = 'Κανενα προβλημα ανοξιας.'.

/*9*/
rule(id(9),values(no, [NO3,Oligochaeta,Izima,H2S,CH4,UnderLayer,WaterScent]),Answer):-
		Oligochaeta = no,
    Izima = anoixta,
    UnderLayer = normal,
    WaterScent = no,
		Answer = 'Κανενα προβλημα ανοξιας.'.

/*10*/
rule(id(10),values(no, [NO3,Oligochaeta,Izima,H2S,CH4,UnderLayer,WaterScent]),Answer):-
		Oligochaeta = no,
    Izima = anoixta,
    UnderLayer = normal,
    WaterScent = yes,
		Answer = 'Μετρια ανοξια.'.

/*11*/
rule(id(11),values(no, [NO3,Oligochaeta,Izima,H2S,CH4,UnderLayer,WaterScent]),Answer):-
		Oligochaeta = few,
		Answer = 'Πολυ Σοβαρο προβλημα ανοξιας.'.

/*12*/
rule(id(12),values(no, [NO3,Oligochaeta,Izima,H2S,CH4,UnderLayer,WaterScent]),Answer):-
		Oligochaeta = enough,
		Answer = 'Μετρια aνοξια.'.
