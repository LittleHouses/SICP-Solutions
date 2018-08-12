(define (make-mobile left right)
    (list left right))

(define (make-branch len structure)
    (list len structure))

(define (left-branch mobile)
    (car mobile))

(define (right-branch mobile)
    (car (cdr mobile)))

(define (branch-length branch)
    (car branch))

(define (branch-structure branch)
    (car (cdr branch)))

(define (total-weight mobile)
    (cond
        ((null? mobile) 0) 
        ((not (pair? (branch-structure mobile))) (branch-structure mobile))
        (else (+ 
            (total-weight (left-branch mobile)) 
            (total-weight (right-branch mobile)))
            )))

(define test-mobile (make-mobile (make-branch 2 3) (make-branch 3 3)))

(define (balanced? mobile)
    (cond 
        ((not (pair? (branch-structure mobile))) (* (branch-structure mobile) (branch-length mobile)))
        (else (=
            (balanced? (left-branch mobile)) (balanced? (right-branch mobile))))))

(define test-balanced (make-mobile (make-branch 2 3) (make-branch 3 3)))

