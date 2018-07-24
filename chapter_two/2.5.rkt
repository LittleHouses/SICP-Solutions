;;; 2^a * 3^b represents a unique prime factorization...
;;; For any given (a,b) some such 2^a * 3^b exists
;;; For any given (a,b), 2^a * 3^b represents a prime factorization of its product which is unique

(define (int-pair a b)
    (*
        (expt 2 a)
        (expt 3 b)))

;;; Example: (int-pair 2 4) == 324

(define (car x)
    (iter-core x 0 2))

(define (cdr x)
    (iter-core x 0 3))

(define (iter-core x factor side)
    (cond 
        ((= (modulo x side) 0) (iter-core (/ x side) (+ factor 1) side))
        (else factor)))


(define alpha (int-pair 2 4))
(display alpha)
(newline)
(display (car alpha))
(newline)
(display (cdr alpha))