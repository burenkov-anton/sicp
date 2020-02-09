#lang sicp

(#%require rackunit)

(define (make-point x y)
  (cons x y))

(define (make-rectangle start-point width height)
  (cons start-point (cons width height)))

(define (get-start-point rect)
  (car rect))

(define (get-width rect)
  (cadr rect))

(define (get-height rect)
  (cddr rect))

(define (rect-square rect)
  (* (get-width rect) (get-height rect)))

(define (rect-perimeter rect)
  (+ (* 2 (get-width rect)) (* 2 (get-height rect))))

(define start-point (make-point 0 0))

(define rectangle (make-rectangle start-point 2 3))

(check-equal? (get-start-point rectangle) start-point)
(check-equal? (get-width rectangle) 2)
(check-equal? (get-height rectangle) 3)
(check-equal? (rect-square rectangle) 6)
(check-equal? (rect-perimeter rectangle) 10)