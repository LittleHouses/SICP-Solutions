;Exercise 1.17 && 1.18

(define (double x)
    (* x 2))

(define (halve x)
    (/ x 2))

(define (alt-mult a b)
    (if (= b 1)
        a
        (cond
            ((even? b) (alt-mult (double a) (halve b)))
            (else (alt-mult (+ a (alt-mult a (- b 1))) 1))
        )))

(define (super-mult a b)
    (mult-iter a b 0))

(define (mult-iter a b r)
    (if (= b 1)
        (+ a r)
        (cond
            ((even? b) (mult-iter (double a) (halve b) r))
            (else (mult-iter a (- b 1) (+ r a)))
        )
    )
)
            