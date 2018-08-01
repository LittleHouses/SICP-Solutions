
(define (make-interval a b) (cons a b))

(define (upper-bound interval) (cdr interval))

(define (lower-bound interval) (car interval))

(define (make-center-width c w)
    (make-interval (- c w) (+ c w)))

(define (center i)
    (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
    (/ (- (upper-bound i) (upper-bound i)) 2))

(define (make-center-percent center tolerance)
    (make-interval center (* tolerance center)))

(define (percent i)
    (/ (width i) (center i)))

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

(define (par1 r1 r2)
    (div-interval 
        (mul-interval r1 r2)
        (add-interval r1 r2)))

(define (par2 r1 r2)
    (let ((one (make-interval 1 1)))
        (div-interval one
            (add-interval
                (div-interval one r1)
                (div-interval one r2)))))

(define A (make-interval 1 3))
(define B (make-interval 4 5))
(define one (make-interval 1 1))

(display (par1 A A))
(newline)
(display (par2 A A))
(newline)
(display(div-interval A A))
;;; For a center-point-form interval this should produce: [0.5,1.5] for A = [1,3]
;;; However, it produces [1/3,3], a much wider interval.
(newline)
(display(div-interval A B))
