;;; Sequence 1,2,3,4
;;; '() == nil ( I dunno why )
(define dumb-list 
    (cons 1
        (cons 2
            (cons 3
                (cons 4 '())))))

;;; ^ construction of List data type

(define one-through-four (list 1 2 3 4))

(define (list-ref items n)
    (if (= n 0)
        (car items)
        (list-ref (cdr items) (- n 1))))

(define squares (list 1 4 9 16 25))

(display (list-ref squares 3))
(newline)

(define (length items)
    (if (null? items)
        0
        (+ 1 (length (cdr items)))))

(define odds (list 1 3 5 7))

(display (length odds))
(newline)

(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (append (cdr list1) list2))))

(define combined (append squares odds))
(display combined)
(newline)