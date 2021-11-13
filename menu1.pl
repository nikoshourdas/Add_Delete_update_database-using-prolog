:- include('KB.pl').
values(OxygenPercentage , [Oligochaeta,Izimata ,H2S,CH4,UnderLayer,WaterScent]).

omp(Results) :-
    write("dwse to pososto ergasthriakwn timwn diaplymenou oxygone,(decimal number/no)"),
    nl,
    read(OxygenPercentage),

    (
      omp_labValues(OxygenPercentage) , !;
      omp_labValues(OxygenPercentage , N03 ),!;
      omp_labValues(OxygenPercentage , [Oligochaeta,Izimata ,H2S,CH4,UnderLayer,WaterScent ])
    ) ,
    bagof(
          Answer
          ,rule(values(OxygenPercentage , [Oligochaeta,Izimata ,H2S,CH4,UnderLayer,WaterScent])
                ,Answer)
                ,
          Results
    ) .

% anagnwrish dedomenou
% oxygen % >= 0.2
omp_labValues(OxygenPercentage) :-
    number(OxygenPercentage),
    OxygenPercentage >= 0.2 .

% <0.2
omp_labValues(OxygenPercentage,N03) :-
    number(OxygenPercentage),
    OxygenPercentage < 0.2 ,nl,
    write("Yparxei parousia N03 (yes/no)?"),nl,
    read(N03).

% no lab data

omp_noLabValues(OxygenPercentage,NoLabValues) :-
    nl,write("Yparxh kokkinwn Oligochaetes , (yes/no)?"),nl,
    read(Oligochaeta),
    (
    (Oligochaeta = few ; Oligochaeta = enough),!;
      (
        nl,write("Yparxei yparxh Izhmatwn , (skoura - maura /anoixta)?"),nl,
        read(Izima),
        (
          member(Izima,[skoura,maura]) , nl ,
          write("Yparxei Yparxh H2S ,(nai/oxi)"),nl,
          read(H2S),
            (
              (H2S = yes),
              !
              ;
              (
                nl,write("Yparxei parousia CH4 , (yes/no)?"),
                nl,read(CH4)
              )
            )),!;
        (
          Izima = anoixta , nl ,
          write("tUnderLayers UnderLayerstromatos , (mesaio - megalo / kanoniko)"),nl ,
          read(UnderLayer),
          (
            (member(UnderLayer , [mesaio ,megalo])),!;
            (UnderLayer = kanoniko),!;
            (nl,write("Does the water smell bad , (yes/no)"),nl,read(WaterScent))
          )

        )
      )

    ),
    NoLabValues = [Oligochaeta,Izimata ,H2S,CH4,UnderLayer,WaterScent].
