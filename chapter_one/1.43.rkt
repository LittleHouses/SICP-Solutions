(define (compose f g)
    (lambda (x) (f (g x))))

(define (inc x) (+ 1 x))

(define (square x) (* x x))

(define (repeated f n)
    (repeated-iter f n))

(define (repeated-iter f n)
    (cond 
        ((= 1 n) f)
        (else (compose f (repeated-iter f (- n 1))))))

