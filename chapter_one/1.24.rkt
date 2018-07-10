(define (runtime) (current-milliseconds))

(define (expmod base exp m)
    (cond 
        ((= exp 0 ) 1)
        ((even? exp)
            (remainder (square (expmod base (/ exp 2) m))
                m))
        (else 
            (remainder (* base (expmod base (- exp 1) m))
                m))))

(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
    (cond 
        ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (square x)
    (* x x))

(define (next x)
    (if (= x 2)
        3
        (+ x 2)))

(define (smallest-divisor n)
    (find-divisor n 2))

(define (find-divisor n test-divisor)
    (cond 
        ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
    (= (remainder b a) 0))

(define (prime? n)
    (= n (smallest-divisor n)))

(define (timed-prime-test n)
    (newline)
    (display n)
    (newline)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (fast-prime? n 1000)
        (begin
            (report-prime (- (runtime) start-time)))))

(define (report-prime elapsed-time)
    (display " Prime *** Time: ")
    (display elapsed-time)
    (newline))

(define (first-primes base)
    (first-primes-run base 0))

(define (first-primes-run test iter)
    (if (< iter 3)
        (if (even? test)
            (first-primes-run (+ test 1) iter)
            (if (fast-prime? test 1000)
                (begin 
                    (timed-prime-test test)
                    (first-primes-run (+ test 2) (+ iter 1)))
                    (first-primes-run (+ test 2) iter)))))