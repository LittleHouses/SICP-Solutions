;;; Cases: all pos, all neg, onepos/oneneg -> 3x3 = 9
;;; This was very tedious 

(define (make-interval a b) (cons a b))

(define (upper-bound interval) (cdr interval))

(define (lower-bound interval) (car interval))

(define (mul-interval x y)
    (let (
        (p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
            (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))

(define (improved-mult a b)   
    (cond 
        ((and (positive? (lower-bound a)) (positive? (upper-bound a)) (positive? (lower-bound b)) (positive? (upper-bound b)))
        (make-interval (* (lower-bound a) (lower-bound b)) (* (upper-bound a) (upper-bound b))))

        ((and (positive? (lower-bound a)) (positive? (upper-bound a)) (negative? (lower-bound b)) (negative? (upper-bound b)))
        (make-interval (* (upper-bound a) (lower-bound b)) (* (lower-bound a) (upper-bound b))))

        ((and (positive? (lower-bound b)) (positive? (upper-bound b)) (negative? (lower-bound a)) (negative? (upper-bound a)))
        (make-interval (* (lower-bound a) (upper-bound b)) (* (upper-bound a) (lower-bound b))))

        ((and (negative? (lower-bound a)) (negative? (upper-bound a)) (negative? (lower-bound b)) (negative? (upper-bound b)))
        (make-interval (* (upper-bound a) (upper-bound b)) (* (lower-bound a) (lower-bound b))))

        ((and (negative? (lower-bound a)) (positive? (upper-bound a)) (positive? (lower-bound b)) (positive? (upper-bound b)))
        (make-interval (* (lower-bound a) (upper-bound b)) (* (upper-bound a) (upper-bound b))))

        ((and (positive? (lower-bound a)) (positive? (upper-bound a)) (negative? (lower-bound b)) (positive? (upper-bound b)))
        (make-interval (* (upper-bound a) (lower-bound b)) (* (upper-bound a) (upper-bound b))))

        ((and (negative? (lower-bound a)) (positive? (upper-bound a)) (negative? (lower-bound b)) (negative? (upper-bound b)))
        (make-interval (* (upper-bound a) (lower-bound b)) (* (lower-bound a) (lower-bound b))))

        ((and (negative? (lower-bound a)) (negative? (upper-bound a)) (negative? (lower-bound b)) (positive? (upper-bound b)))
        (make-interval (* (lower-bound a) (upper-bound b)) (* (lower-bound a) (lower-bound b))))

        (else 
            (let (
                (p1 (* (lower-bound a) (lower-bound b)))
                (p2 (* (lower-bound a) (upper-bound b)))
                (p3 (* (upper-bound a) (lower-bound b)))
                (p4 (* (upper-bound a) (upper-bound b))))
                    (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))))



        
        