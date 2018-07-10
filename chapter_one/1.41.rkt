(define (double f)
    (lambda (x) (f (f x))))

(define (square x) (* x x))

(define (inc x) (+ x 1))

;;; (((double (double double)) inc) 5) == 21