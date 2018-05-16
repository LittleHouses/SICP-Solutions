;Exercise 1.16

(define (fast-exp b n)
    (cond ((= n 0) 1)
        ((even? n) (square (fast-exp b (/ n 2))))
        (else (* b (fast-exp b (- n 1))))))

(define (square x)
    (* x x))

(define (exp b n)
    (exp-iter b n 1))

(define (exp-iter b n a)
    (if (< n 1)
        a
        (cond 
            ((even? n) 
                (exp-iter (square b) (/ n 2) a))
            (else (exp-iter (square b) (/ (- n 1) 2) (* a b))))))


       