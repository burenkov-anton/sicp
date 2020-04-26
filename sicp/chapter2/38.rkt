#lang sicp

(#%require rackunit)

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define example (list 1 2 3))

(check-equal? (fold-right / 1 example) 3/2)
(check-equal? (fold-left / 1 example) 1/6)
(check-equal? (fold-right list nil example) '(1 (2 (3 ()))))
(check-equal? (fold-left list nil example) '(((() 1) 2) 3))
; op should not depend on the order of sequence elements
; then result of fold-right will be equal with fold-left result
(check-equal? (fold-right + 0 example) (fold-left + 0 example))
(check-equal? (fold-right * 1 example) (fold-left * 1 example))
