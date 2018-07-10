(define (make-rat n d)
    (let ((g (gcd n d)))
        (if (> (* n d) 0)
            (cons (/ n g) (/ d g))
            (cons
                (* -1 (abs (/ n g)))
                (abs (/ d g))))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
    (display (numer x))
    (display "/")
    (display (denom x)))
    (newline)

(define (add-rat x y)
    (make-rat 
        (+ (* (numer x) (denom y))
            (* (numer y) (denom x)))
        (* (denom x) (denom y))))

(define (sub-rat x y)
    (make-rat 
        (- (* (numer x) (denom y))
            (* (numer y) (denom x)))
        (* (denom x) (denom y))))

(define (mul-rat x y)
    (make-rat 
        (* (numer x) (numery))
        (* (denom x) (denom y))))

(define (div-rat x y)
    (make-rat 
        (* (numer x) (denom y))
        (* (denom x) (numer y))))

(define (equal-rat? x y)
    (= 
        (* (numer x) (denom y))
        (* (numer y) (denom x))))

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

    


