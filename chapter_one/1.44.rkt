(define dx 0.00001)

(define (smooth f)
    (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (square x) (* x x))

(define (compose f g)
    (lambda (x) (f (g x))))

(define (inc x) (+ 1 x))

(define (repeated f n)
    (cond 
        ((= 1 n) f)
        (else (compose f (repeated f (- n 1))))))

(define (n-fold-smooth f n)
    ((repeated smooth n) f))