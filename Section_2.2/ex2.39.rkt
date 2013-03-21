#lang racket
;; Exercise 2.39

(require "../helpers.rkt")

(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (fold-left-iter op result rst)
    (if (null? rst)
      result
      (fold-left-iter op (op result (car rst)) (cdr rst))))
  (fold-left-iter op initial sequence))

(define (reverse-right seq)
  (fold-right (lambda (x y) (append y (list x))) nil seq))

(define (reverse-left seq)
  (fold-left (lambda (x y) (cons y x)) nil seq))

;; Tests
(equal-lists? (reverse-right '(1 2 3 4 5))
              '(5 4 3 2 1))

(equal-lists? (reverse-left '(1 2 3 4 5))
              '(5 4 3 2 1))
