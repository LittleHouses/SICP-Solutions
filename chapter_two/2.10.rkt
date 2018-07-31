(define (make-interval a b) (cons a b))

(define (upper-bound interval) (cdr interval))

(define (lower-bound interval) (car interval))

(define (div-interval x y)
    (if (and (<= (lower-bound y) 0) (> (upper-bound y) 0))
        (display "You can't divide by zero, you silly goose!")
        (mul-interval x
            (make-interval 
                (/ 1.0 (upper-bound y))
                (/ 1.0 (lower-bound y))))))

(define a (make-interval 3 4))
(define b (make-interval -2 2))

