
:- include('KB.pl').
:- include('menu1.pl').
:- dynamic delete/2.
:- dynamic rule/3.

/*gia na treksei h askhsh xreiazontai absolute paths*/


menu :-
    write("1 . diagnwsh provlimatwn apo to perivalontiko systhma gnwshs") , nl ,
    write("2 . enhmerwsh thw Bashs Gnwshs ") , nl ,
    write("3 . exit "), nl ,
    write(" -> ") ,read(MenuChoice),nl,
    menuHandler(MenuChoice).

menuHandler(1) :-
    write("diagnoses"),nl,
    consult('C:/Users/aaaci/OneDrive/Desktop/menu1.pl'),
    write("Returning to main menu"),nl,nl,
    menu.

menuHandler(2) :-
    write("1 . diagrafh kanona "), nl , /*subMenuHandler(1)*/
    write("2 . prosthiki neou kanona ") , nl , /*subMenuHandler(2)*/
    write("3 . tropopoihsh yparxontos kanona "), nl, /*subMenuHandler(3)*/
    write("4 . apothikeush kai eksodos ") , nl ,/*subMenuHandler(4)*/
    write(" -> "),read(SubMenuChoice) ,
    subMenuHandler(SubMenuChoice).

menuHandler(_):- write("this is a failure ").

subMenuHandler(1) :-
    write("---Diagrafh kanona---"),
    write("id of the rule you want to delete: "),nl,
    write("-> "),read(SubMenuDeleteChoice),nl,
    retractall(rule(id(SubMenuDeleteChoice),values(_,_),_)),/*file i want to delte from*/
    write("Returning to Main Menu : "),nl,
    menu.

/*add new rule*/
subMenuHandler(2) :-
  addKBnewRule,
  menu.

    getKBFilePath(KBFilePath):-
      getWorkingDirectory(WorkingDirectory),
      getKBFileName(KBFileName),
      atom_concat(WorkingDirectory, KBFileName, KBFilePath).

    getWorkingDirectory(WorkingDirectory) :-
      WorkingDirectory = /*working directory path*/.

    getKBFileName(KBFileName):-
      KBFileName = 'KB.pl'.

    addKBnewRule :-
      getKBFilePath(KBFilePath),
      consult(KBFilePath),
      write("---add new rule---"),nl,
      addNewRule,nl,
      listing(rule/3).

    addNewRule:-

      write('new rule id'),nl,write('-> '),
      read(NewRuleId),nl,

      write('data of the problem'),nl,
      read(NewData),

      write('rule conditions: '),nl,write('-> '),
      read(NewRuleCondition),

      write('rule Results'),nl,write('-> '),
      read(NewRuleAnswer),nl,

      assertz((rule(NewRuleId,NewData,'$VAR(65)'):- NewRuleCondition,'$VAR(65)' = NewRuleAnswer)),
      write("Returning to main menu"),nl.


/* modify Rule */
subMenuHandler(3) :-
    write("---tropopoihsh yparxontos kanona---"),
    write("id of rule that requires modification : "),nl
    write("-> "),read(ModificationId),nl,
    retractall(rule(id(ModificationId),values(_,_),_)),nl
    write("modified Rule Condition"),nl,
    write("-> "), read(ModificationId),nl
    write("modified New Rule Answer"),nl,
    write("-> "),read(ModificationRuleAnswer),nl,
    assertz((rule(ModificationId, values('$VAR'(10),['$VAR'(11),['$VAR'(12),'$VAR'(13),'$VAR'(14),'$VAR'(15),'$VAR'(16),'$VAR'(17)]]), ModifiedAnswer):- ModificationRuleAnswer,ModifiedAnswer=ModificationRuleAnswer,!)),
    write("Returning to main menu"),nl,nl,
    menu.

/*save Rule*/
subMenuHandler(4) :-
    write("---test apothikeush kai eksodos---"),
    tell('../KB.pl'),
    retractall(rule),
    listing(rule),
    told,reconsult('../KB.pl').
