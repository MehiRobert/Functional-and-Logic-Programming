
;removeAll(l1...ln,e) = []               , n = 0
;                      removeAll(l2...ln,e), l1 = e
;                      l1 U removeAll(l2...ln,e),otherwise

; toSet(l1...ln,r1...rm) = r1..rm , n = 0
;                           toSet(removeAll(l1...ln,l1),l1) , m = 0
;                         toSet(removeAll(l2...ln,l2), r U l2) , otherwise


(defun removeAll(L E)
    (cond
            ((null L) L)

            ((equal (car L) E) (removeAll (cdr L) E))
            (T (cons (car L) (removeAll (cdr L) E)))
)
)

( defun toSet(L LSet)
    
    (cond
        
        ((null L) LSet)
        
        ((null LSet) (toSET (removeAll L (car L)) (list (car L))))
        
        (T (toSet (removeAll L (car L)) (append LSet (list (car L)))))
        )
    )
(print (toSet '(1 2 5 2 3 3 3 5 2 5 5 5 5 1 2) nil))






