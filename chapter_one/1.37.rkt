;; Golden Ratio = 1.61803398875
;; Recursive Process: (needs to be fixed)
(define (cont-frac n d k i)
    (cond
        ((= i k) 
         (/ (n k) (d k)))
        (else (/ (n k) (+ (d k) (cont-frac n d k (+ i 1)))))))

;; Iterative Process:
(define (internal n d k sum)
    (if (> k 0)
        (internal n d (- k 1) (/ (n k) (+ (d k) sum)))
        sum))

(define (cont-frac-iter n d k)
    (internal n d k 0))
    
;; (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 10) && (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 10)
;; returns: 0.617977528089888 (accuracy of 2 decimal points)

(define phi 1.61803398875)

;; Method to determine the number of iterations to achieve 4 decimal accuracy

(define (find-four n d k)
    (cond 
        ((< (abs (- (cont-frac n d k) (/ 1 phi))) 0.0001)
         (display k))
        (else (find-four n d (+ k 1)))))



;; For 4 decimal accuracy, k = 10
