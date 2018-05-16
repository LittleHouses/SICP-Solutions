(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

;; For an interpreter using normal-order-evaluation performing (gcd 206 40), the remainder operation 
;; will be performed 5 times, since the final iteration (gcd 2 0) contains a remainder operation. 
;; An interperater using implicative-order-evaluation will not preform this final remainder operation.
;; using a substiution for it that never needs replacement.
;; And thus will only perform the remainder operation 4 times.