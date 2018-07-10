;; J.H. Lambert is a hunk, but no one will ever match Leonhard Eular. 

(define (lambert-N k x)
    (cond 
        ((= k 1)
         x)
        (else (* x x))))

(define (lambert-D k)
    (- (* 2 k) 1))

(define (internal n x d k sum)
    (if (> k 0)
        (internal n x d (- k 1) (/ (n k x) (- (d k) sum)))
        sum))

(define (cont-frac-iter n x d k)
    (internal n x d k 0))

(define (tan-cf x)
    (cont-frac-iter lambert-N x lambert-D 100))