
(define (make-interval a b) (cons a b))

(define (upper-bound interval) (cdr interval))

(define (lower-bound interval) (car interval))

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

(define A (make-interval 1 3))
(define B (make-interval 1 3))

(define arb_proc1
    (mul-interval A
        (div-interval B B)))

(define arb_proc2
    (mul-interval A
        (div-interval A
            (mul-interval A
                (div-interval A A)))))
;;; Theoretically should return A

(display arb_proc1)
(newline)
(display arb_proc2)
(newline)

;;; arb_proc1 = (0.5,6.0). arb_proc2 = (0.25, 12)
;;; Supersets of our original interval -> Less Accurate, Less "tight"
;;; We double the uncertainty with each 



(display (mul-interval A A))

;;; When we perfrom calculations with numbers that are uncertain -> intevals, we compound that uncertainty. 
;;; This has to do with the fact that we take the max and min when we multiple 2 intervals. 
#| observe:
Let I = [a,b]
Theoretically, we would expect preforming an arbitrary amount of inverse arithma