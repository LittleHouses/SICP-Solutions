(define (square x) (* x x))

(define (make-point x y) 
    (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (make-segment p1 p2)
    (cons p1 p2))

(define (start-segment line)
    (car line))

(define (end-segment line)
    (cdr line))

(define (length-segment line)
    (sqrt
        (+
            (square (-
                (x-point (end-segment line))
                (x-point (start-segment line))))
            (square (-
                (y-point (end-segment line))
                (y-point (start-segment line)))))))

;;; Define rectangle by two parallel lines

(define (make-rect line1 line2)
    (cons line1 line2))

(define (rect-get-first rect)
    (car rect))

(define (rect-get-second rect)
    (cdr rect))

(define (get-perimeter rect)
    (+ 
        (length-segment (rect-get-first rect))
        (length-segment (rect-get-second rect))
        (length-segment (make-segment (start-segment (rect-get-first rect)) (start-segment (rect-get-second rect))))
        (length-segment (make-segment (end-segment (rect-get-first rect)) (end-segment (rect-get-second rect))))))

(define (get-area rect)
    (newline))

(define p1 (make-segment 1 1))
(define p2 (make-segment 2 1))
(define p3 (make-segment 1 2))
(define p4 (make-segment 2 2))

(define line1 (make-segment p1 p2))
(define line2 (make-segment p3 p4))

(define rect (make-rect line1 line2))

