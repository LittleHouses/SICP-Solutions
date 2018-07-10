(define dx 0.00001)

(define (deriv g)
    (lambda (x)
        (/ (- (g (+ x dx)) (g x))
        dx)))

(define (newton-transformation g)
    (lambda (x)
        (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
    (fixed-point (newton-transformation g) guess))

(define tolerance 0.001)

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

(define (cube x) (* x x x))

(define (square x) (* x x))

(define (cubic a b c)
    (lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))