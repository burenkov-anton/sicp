#lang sicp

(#%require rackunit)

(define (make-from-mag-ang mag ang)
  (define (dispatch op)
    (cond ((eq? op 'real-part) (* mag (cos ang)))
          ((eq? op 'imag-part) (* mag (sin ang)))
          ((eq? op 'magnitude) mag)
          ((eq? op 'angle) ang)
          (else (error "Unknown op -- MAKE-FROM-MAG-ANG" op))))
  dispatch)

(define magnitude 2)
(define angle 90.0)

(define test-value (make-from-mag-ang magnitude angle))

(check-equal? (test-value 'magnitude) magnitude)
(check-equal? (test-value 'angle) angle)
(check-equal? (test-value 'real-part) (* magnitude (cos angle)))
(check-equal? (test-value 'imag-part) (* magnitude (sin angle)))