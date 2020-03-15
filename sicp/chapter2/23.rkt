#lang sicp

(define (my-for-each proc list)
  (if (null? list)
      (newline)
      ((lambda (x) (proc (car x))
       (my-for-each proc (cdr x))) list)))

(define (example-print)
  (my-for-each (lambda (x) (newline) (display x)) (list 1 2 3 4)))