#lang sicp

(#%require rackunit)

(define (make-vect x y)
  (cons x y))

(define (xcor-vect vect)
  (car vect))

(define (ycor-vect vect)
  (cdr vect))

(define (add-vect vec1 vec2)
  (make-vect (+ (xcor-vect vec1) (xcor-vect vec2))
             (+ (ycor-vect vec1) (ycor-vect vec2))))

(define (sub-vect vec1 vec2)
  (make-vect (- (xcor-vect vec1) (xcor-vect vec2))
             (- (ycor-vect vec1) (ycor-vect vec2))))

(define (scale-vect s vect)
  (make-vect (* s (xcor-vect vect)) (* s (ycor-vect vect))))

(define vec1 (make-vect 1.0 2.0))
(define vec2 (make-vect 0.5 0.5))

(check-equal? (xcor-vect vec1) 1.0)
(check-equal? (ycor-vect vec2) 0.5)
(check-equal? (add-vect vec1 vec2) (make-vect 1.5 2.5))
(check-equal? (sub-vect vec1 vec2) (make-vect 0.5 1.5))
(check-equal? (scale-vect 2 vec2) (make-vect 1.0 1.0))
