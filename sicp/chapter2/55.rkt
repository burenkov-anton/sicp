#lang sicp

(#%require rackunit)

(check-equal? (car ''(abracadabra)) (car (quote (quote abracadabra))))
