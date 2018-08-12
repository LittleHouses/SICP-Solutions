(define (count-leaves x)
    (cond 
        ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(define oak (cons (list 1 2) (list 3 4)))

(display "If things end up a bit too heavy, you have this many leaves: ")
(display (count-leaves oak))
(newline)