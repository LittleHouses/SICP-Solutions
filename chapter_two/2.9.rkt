(define (make-interval a b) (cons a b))

(define (upper-bound interval) (cdr interval))

(define (lower-bound interval) (car interval))

(define (width interval) 
    (/
        (+ (upper-bound interval) (lower-bound interval))
        2))

(define (add-interval x y )
    (make-interval 
        (+ (lower-bound x) (lower-bound y))
        (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
    (make-interval 
        (- (lower-bound x) (lower-bound y))
        (- (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
    (let (
        (p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
            (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))

(define (div-interval x y)
    (mul-interval x
        (make-interval 
            (/ 1.0 (upper-bound y))
            (/ 1.0 (lower-bound y)))))


;;; width of the sum is a function only of the widths of the intervals

(define a (make-interval 2 4))
(define b (make-interval 5 7))

(define bool 
    (= 
        (width (add-interval a b))
        (+ (width a) (width b))))

(display "Addition: ")
(display bool)
(newline)

(define bool 
    (= 
        (width (sub-interval a b))
        (- (width a) (width b))))

(display "Subtraction: ")
(display bool)
(newline)

(define bool 
    (= 
        (width (mul-interval a b))
        (* (width a) (width b))))

(display "Multiplication: ")
(display bool)
(newline)

(define bool 
    (= 
        (width (div-interval a b))
        (/ (width a) (width b))))

(display "Division: ")
(display bool)
(newline)

;;; Output ->
;;; Addition: #t
;;; Subtraction: #t
;;; Multiplication: #f
;;; Division: #f