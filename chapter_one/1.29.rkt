(define (sum term a next b iter n)
    (if (> a b)
        0
        (+ (term a iter n)
            (sum term (next a) next b (+ iter 1) n))))

(define (cube x) (* x x x))

(define (simpsons f a b n)
    (define (next x)
        (+ x (/ (- b a) n)))
    (define (simp-f a y n)
        (cond 
            ((= y 0) (f a))
            ((= y n) (f a))
            ((even? y) (* 2 (f a)))
            (else (* 4 (f a)))))
    (* (/ (/ (- b a) n) 3)
    (sum simp-f a next b 0 n)))
