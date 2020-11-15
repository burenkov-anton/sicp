#lang sicp

(#%require rackunit)

(define (call-the-cops) (error "Cops called"))

(define (make-account balance secret)
  (let ((attempts 0))
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch key m)
    (cond ((eq? key secret)
           (begin (set! attempts 0)
                  (cond ((eq? m 'withdraw) withdraw)
                        ((eq? m 'deposit) deposit)
                        (else (error "Unknown request -- MAKE-ACCOUNT"
                                     m)))))
          (else (if (>= attempts 6)
                           (call-the-cops)
                           (begin
                             (set! attempts (inc attempts))
                             (error "Wrong password"))))))
  dispatch))

(define acc (make-account 100 's-p))
