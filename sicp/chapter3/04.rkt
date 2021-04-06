#lang racket

(require rackunit)
(require racket/exn)

(define (inc x) (+ x 1))

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
          (else (if (>= attempts 7)
                           (call-the-cops)
                           (begin
                             (set! attempts (inc attempts))
                             (error "Wrong password"))))))
  dispatch))

(define acc (make-account 100 'secret-password))

(define wrong-message "Wrong password\n")

(define cops-message "Cops called\n")

(define (attempt)
  (with-handlers ([exn:fail?
                    (lambda (e) (exn->string e))])
     ((acc 'some-other-password 'deposit) 50)))

(check-equal? ((acc 'secret-password 'withdraw) 40) 60)
(check-equal? ((acc 'secret-password 'deposit) 40) 100)
(check-equal? (attempt) wrong-message)
(check-equal? (attempt) wrong-message)
(check-equal? (attempt) wrong-message)
(check-equal? (attempt) wrong-message)
(check-equal? (attempt) wrong-message)
(check-equal? (attempt) wrong-message)
(check-equal? (attempt) wrong-message)
(check-equal? (attempt) cops-message)

