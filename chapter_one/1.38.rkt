(define (eular k)
    (cond
        ((= (modulo (+ k 1) 3) 0)
         (* 2 (/ (+ k 1) 3)))
        (else 1 )))


(define (internal n d k sum)
    (if (> k 0)
        (internal n d (- k 1) (/ (n k) (+ (d k) sum)))
        sum))

(define (cont-frac-iter n d k)
    (internal n d k 0))

(display (+ 2 (cont-frac-iter (lambda (i) 1.0) eular 100)))