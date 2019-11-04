#lang sicp

(#%require rackunit)

(define (f x)
  (if (< x 3)
      x
      (+ (f (- x 1)) (f (- x 2)) (f (- x 3)))))

(define (f-iter x)
  (define (iter-step a b c count)
    (if (= count 0)
        c
        (iter-step (+ a b c) a b (- count 1))))
  (if (< x 3)
      x
      (iter-step 2 1 0 x)))

(check-equal? (f 5) 11)
(check-equal? (f-iter 5) 11)