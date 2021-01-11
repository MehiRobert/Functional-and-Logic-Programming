;gnu clisp  2.49.60

;gnu clisp  2.49.60

; parcurg_st(l1l2...ln,nv,nm) = [], n = 0
;                             = [], nv = nm+1
;                             l1 U l2 parcurg_st(l3...ln,nv+1,nm + l2), otherwise
(defun parcurg_st(arb nv nm) 
    (cond
        ((null arb) nil)
        ((= nv (+ 1 nm)) nil)
        (t (cons (car arb) (cons (cadr arb) (parcurg_st (cddr arb) (+ 1 nv) (+ (cadr arb) nm)))))
) 
)

(defun stang(arb) 
    (parcurg_st (cddr arb) 0 0)
)
(print (stang '(A 2 B 0 C 2 D 0 E 0)))
; parcurg_st(l1l2...ln,nv,nm) = null, n = 0
;                             l, nv = nm+1
;                             parcurg_dr(l3...ln,nv+1,nm+l2)
(defun parcurg_dr(arb nv nm) 
    (cond
        ((null arb) nil)
        ((= nv (+ 1 nm)) arb)
        (t (parcurg_dr (cddr arb) (+ 1 nv) (+ (cadr arb) nm)))
) 
)
(defun drept(arb)
    (parcurg_dr (cddr arb) 0 0)
)


; inOrder(l1l2...ln) = [], n = 0
;                    = inOrder(stang(l1l2...ln)) U l1 U inOrder(drept(l1l2...ln))
(defun inOrder(arb)
    (cond
        ((null arb) nil)
        (t (append (inOrder (stang arb)) (list (car arb)) (inOrder (drept arb))))
         )
    )
(print (inOrder ' (a 2 b 2 c 1 i 0 f 1 g 0 d 2 e 0 h 0)))