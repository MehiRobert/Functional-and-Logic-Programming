

; nthElem(l1..ln, n) = null , n = 0
            ;	       l1 , n = 1
        ;		       nthElem(l2..ln,n-1),otherwise



;gnu clisp  2.49.60

(defun nthElem(L N)
    (cond
        
        ((null L) nil)
        
        ((= N 1) (car L))
        
        (T (nthElem (cdr L) (- N 1)))
        
        
    )
    )

(print "The n'th element is: ")
(print (nthElem '(1 7 3 4 5 8) 6))
 