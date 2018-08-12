(define (map proc items)
    (if (null? items)
        '()
        (cons
            (proc (car items))
            (map proc (cdr items)))))

(define (square-list-1 items)
    (if (null? items)
        '()
        (cons 
            (* (car items) (car items))
            (square-list-1 (cdr items)))))

(define (square-list-2 items)
    (map (lambda (x) (* x x)) items))

(define lisztomania (list 1 2 3 4 5))

(display "first: ")
(display (square-list-1 lisztomania))
(newline)
(display "Second: ")
(display (square-list-2 lisztomania))
(newline)