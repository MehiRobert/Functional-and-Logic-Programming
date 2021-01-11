%bubblesort(L:list,Sorted:List)
%flowmodel(I,O)
bubblesort(List,Sorted) :-
   swap(List,List1),
   !,
   bubblesort(List1,Sorted).
bubblesort(Sorted,Sorted).

%swap(L:list,List1:List)
%flowmodel(I,O)
swap([X,Y|Rest],[Y,X|Rest]) :-   
   X > Y.
swap([Z|Rest],[Z|Rest1]) :-      
   swap(Rest,Rest1).
%remove_dup(L:list,RezList:List)
%flowmodel(I,O)
remove_dup([H1,H2|List],NewList):-
    H1 =:= H2,!,
    remove_dup([H2|List],NewList).
remove_dup([H1,H2|List],NewList):-
    remove_dup([H2|List],NewList1),
    NewList = [H1|NewList1].
remove_dup(List,List).

main(L,R):- bubblesort(L,R1),
            remove_dup(R1,R).
