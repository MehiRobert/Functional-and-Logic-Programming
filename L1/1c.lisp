;gnu clisp  2.49.60

;gnu clisp  2.49.60


; countSublists(l1..ln,ok) =  rez , n = 0
       ;                          countSublists(l, l), ok = 0
;                                 countSublists(notaListanymore(l1)...lm,r U l1), islist(l1)
;                                 countSublists(l2..lm,r1..rm),otherwise                               
(defun countSublists(L ok)
    
    (cond
        ((null L) nil)
        
        ((= ok 0) (append (list L) (countSublists L 1)))
        
        ((listp (car L))  (append (list (car L)) (countSublists (append (car L) (cdr L)) ok)))
        
        (T (countSublists (cdr L) ok))
        
        )
    )
(print (countSublists '(1 2 (3 (4 5) (6 7)) 8 (9 10)) 0))









