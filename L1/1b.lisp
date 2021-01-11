;gnu clisp  2.49.60

;checkAtom(l1..ln,E) = null, n = 0
;                      True , E = l1
;                      checkAtom(l1l2...ln,e) , isList(l1)
;                      checkAtom(l2...ln,e), otherwise




(defun checkAtom(L E)
    
    (cond
        ((null L) nil)
        
        ((equal E (car L)) T)
        
        ((listp (car L)) (checkAtom (append (car L) (cdr L)) E))
        
        (T (checkAtom (cdr L) E))
        )
    )
(print (checkAtom '(1 2 4 (1 'A 9) 7 8) 'A))