(define one-through-four (list 1 2 3 4))

(define (last-pair items)
    (if (null? (cdr items))
        (car items)
        (last-pair (cdr items))))