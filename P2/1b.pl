%bubblesort1(L:list,Sorted:List)
%flowmodel(I,O)
bubblesort1(List,Sorted) :-
   swap1(List,List1),
   !,
   bubblesort1(List1,Sorted).
bubblesort1(Sorted,Sorted).
%swap1(L:list,R:List)
%flowmodel(I,O)
swap1([X,Y|Rest],[Y,X|Rest]) :-   
   X > Y.
swap1([Z|Rest],[Z|Rest1]) :-      
   swap1(Rest,Rest1).

%remove_dup1(L:list,RezList:List)
%flowmodel(I,O)
remove_dup1([H1,H2|List],NewList):-
    H1 =:= H2,
    remove_dup1([H2|List],NewList).
remove_dup1([H1,H2|List],NewList):-
    remove_dup1([H2|List],NewList1),
    NewList = [H1|NewList1].

remove_dup1(List,List).
%elimSub(L:list,RezList:List)
%flowmodel(I,O)
elimSub([],[]).
elimSub([H|T],R):-
    is_list(H),
    bubblesort1(H,R1),
    remove_dup1(R1,R2),!,
    elimSub(T,R3),
    R = [R2|R3].
elimSub([H|T],R):-
    elimSub(T,R1),
    R = [H|R1].

mainb(L,R):- elimSub(L,R).
