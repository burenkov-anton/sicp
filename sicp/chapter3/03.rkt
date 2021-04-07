#lang racket

(require rackunit)
(require racket/exn)

(define (make-account balance secret)
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
           (cond ((eq? m 'withdraw) withdraw)
                 ((eq? m 'deposit) deposit)
                 (else (error "Unknown request -- MAKE-ACCOUNT"
                       m))))
          (else (error "Incorrect password"))))
  dispatch)

(define incorrect-message "Incorrect password\n")

(define insufficient-message "Insufficient funds")

(define acc (make-account 100 'secret-password))

(define (wrong-password-attempt)
  (with-handlers ([exn:fail?
                    (lambda (e) (exn->string e))])
     ((acc 'some-other-password 'deposit) 50)))

(define (insufficient-funds-attempt)
  (with-handlers ([exn:fail?
                    (lambda (e) (exn->string e))])
     ((acc 'secret-password 'withdraw) 5000)))

(check-equal? ((acc 'secret-password 'withdraw) 40) 60)
(check-equal? ((acc 'secret-password 'deposit) 40) 100)
(check-equal? (wrong-password-attempt) incorrect-message)
(check-equal? (insufficient-funds-attempt) insufficient-message)
