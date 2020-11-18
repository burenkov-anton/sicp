#lang racket

(#%require rackunit)

(define (make-f value)
  (lambda (arg)
    (define (dispatch)
      (if (= value 0)
          0
          (begin
            (set! value 0)
            arg)))
    (dispatch)))
          
(define f (make-f 1))

(check-equal? (+ (f 0) (f 1)) 0)

(define g (make-f 1))

(check-equal? (+ (g 1) (g 0)) 1)
