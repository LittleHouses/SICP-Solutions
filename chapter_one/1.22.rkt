(define (runtime) (current-milliseconds))

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
    (if (prime? n)
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
            (if (prime? test)
                (begin 
                    (timed-prime-test test)
                    (first-primes-run (+ test 2) (+ iter 1)))
                    (first-primes-run (+ test 2) iter)))))