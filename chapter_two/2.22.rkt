(define (sqaure x) (* x x))

(define (square-list items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things) (cons (square (car things)) answer))))
    (iter items '()))

;;; The list is reversed because (cons (square (car things)) answer)) puts answer in cdr.

;;; Both procedures add an element to the list by pointing to answer, so each element is placed at the front of the list. 
