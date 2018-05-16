(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
            (sum term (next a) next b))))

(define (sum-cubes a b)
    (sum cube a inc b))

(define (cube x) (* x x x))

(define (inc n) (+ n 1))

(define (identify x) x)

(define (sum-integers a b)
    (sum identify a inc b))

(define (integral f a b dx)
    (define (add-dx x) (+ x dx))
    (* (sum f (+ a (/ dx 2.0)) add-dx b)
        dx))