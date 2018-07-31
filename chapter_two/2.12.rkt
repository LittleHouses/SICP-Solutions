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