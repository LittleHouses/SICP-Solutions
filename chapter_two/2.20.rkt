
(define (same-parity x . w)
    (cond 
        ((even? x)
            (define (evens items)
                (if (null? items)
                    items
                    (if (even? (car items))
                        (cons (car items) (evens (cdr items)))
                        (evens (cdr items)))))
            (evens w))
        (else 
            (define (odds items)
                (if (null? items)
                    items
                    (if (odd? (car items))
                        (cons (car items) (odds (cdr items)))
                        (odds (cdr items)))))
            (odds w))))
