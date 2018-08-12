(define list-1 (list 1 3 (list 5 7) 9))
(display list-1)
(newline)
(define seven-1 (car (cdr (car (cdr (cdr list-1))))))

(define list-2 (list (list 7)))
(display list-2)
(newline)
(define seven-2 (car (car list-2)))

(define list-3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(define seven-3 (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr list-3)))))))))))))
(display list-3)
(newline)

(display (= seven-1 seven-2 seven-3 7))
(newline)
