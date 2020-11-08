#lang sicp

(#%require rackunit)

(define (make-monitored f)
  (let ((acc 0))
    (lambda (arg)
      (cond ((eq? arg 'how-many-calls?) acc)
            ((eq? arg 'reset-count)
             (begin (set! acc 0) acc))
            (else
             (begin (set! acc (+ acc 1))
                    (f arg)))))))

(define s (make-monitored sqrt))

(check-equal? (s 100) 10)
(check-equal? (s 25) 5)
(check-equal? (s 'how-many-calls?) 2)
(check-equal? (s 'reset-count) 0)
(check-equal? (s 100) 10)
(check-equal? (s 'how-many-calls?) 1)
