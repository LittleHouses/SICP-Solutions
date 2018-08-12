(define (reverse items) 
    (define (iter items result) 
      (if (null? items) 
          result 
          (iter (cdr items) (cons (car items) result)))) 
   
    (iter items '()))

    
(define x (list (list 1 2) (list 3 4)))

(define (deep-reverse lists)
    (define (iter lists result)
        (if (null? lists)
            result
            (iter (cdr lists) (cons (reverse (car lists)) result))))
    (iter lists '()))

(display (deep-reverse x))
    