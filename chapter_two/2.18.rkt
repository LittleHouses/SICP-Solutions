
(define items (list 1 2 3 4))

(define empty (list ))

    
(define (reverse-iter-A items n reversed)
    (if (>= n 0)
        (reverse-iter-A
            items
            (- n 1)
            (append reversed (list (list-ref items n))))
        reversed))
    
(define (reverse-A items)
    (let 
        ((reversed (list )))
        (reverse-iter-A items (- (length items) 1) reversed)))



(define (reverse-iter-B items n)
        (if (>= n 0)
            (cons (list-ref items n) (reverse-iter-B items (- n 1)))
            '()))

(define (reverse-B items)
    (reverse-iter-B items (- (length items) 1)))

 (define (reverse items) 
   (define (iter items result) 
     (if (null? items) 
         result 
         (iter (cdr items) (cons (car items) result)))) 
  
   (iter items '())) 
  



