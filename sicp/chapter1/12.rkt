#lang sicp

(#%require rackunit)

(define (pascal-triangle row col)
  (cond (( = col 1) 1)
        (( = col row) 1)
        (( > col row) 0)
        ((+
         (pascal-triangle (- row 1) (- col 1))
         (pascal-triangle (- row 1) col)
         ))
  )
)

(check-equal? (pascal-triangle 1 1) 1)
(check-equal? (pascal-triangle 3 2) 2)
(check-equal? (pascal-triangle 4 3) 3)
(check-equal? (pascal-triangle 5 2) 4)
(check-equal? (pascal-triangle 5 3) 6)
(check-equal? (pascal-triangle 5 6) 0)