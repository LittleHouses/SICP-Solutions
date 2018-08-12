(define y (list (list 1 2) (list 3 4)))

(define (fringe tree)
    (cond
        ((null? tree) '())
        ((not (pair? tree)) (list tree))
        ((pair? tree) (append (fringe (car tree)) (fringe (cdr tree))))))

(display (fringe y))

