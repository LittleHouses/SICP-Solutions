(define (average-damp f) 
    (lambda (x) (average x (f x))))

(define (average x y) 
    (/ (+ x y) 2))

(define (square x) 
    (* x x))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next))))
    (try first-guess))

(define (close-enough? x y)
    (< (abs (- x y)) 0.001))

(define (sqrt-damp x) 
    (fixed-point (average-damp (lambda (y) (/ x y)))
        1.0))

(define dx 0.00001)

(define (deriv g)
    (lambda (x)
        (/ (- (g (+ x dx)) (g x))
        dx)))

(define (newton-transformation g)
    (lambda (x)
        (/ (- (g (+ x dx)) (g x)))))

(define (newtons-method g guess)
    (fixed-point (newton-transformation g) guess))

(define (sqrt-newton x)
    (newtons-method (lambda (y) (- (square y) x)) 1.0))

(define (fixed-point-of-transformation f transform guess)
    (fixed-point (transform g) guess))

