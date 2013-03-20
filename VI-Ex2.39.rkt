#lang racket
;; Exercise 2.39

(require "helpers.rkt")

(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (fold-left-iter op acc rst)
    (if (null? rst)
      acc
      (fold-left-iter op (op acc (car rst)) (cdr rst))))
  (fold-left-iter op initial sequence))

(define (reverse-right l)
  (fold-right (lambda (x y) (append y (list x))) nil 1))

(define (reverse-left l)
  (fold-left (lambda (x y) (cons y x)) nil 1))


