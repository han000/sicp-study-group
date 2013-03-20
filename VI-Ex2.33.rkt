#lang racket
;; Exercise 2.33

(require "helpers.rkt")

(define l '(1 2 3 4 5))
(define l2 '(6 7 8 9 10))

;; Map
(define (map proc l)
  (accumulate (lambda (x l) 
                (cons (proc x) l))
              '()
              l))

;; Append
(define (append list1 list2)
  (accumulate (lambda (x l) (cons x l))
              list2
              list1))

;; Length
(define (length list)
  (accumulate (lambda (x y) (+ y 1)) 0 list))

;; Tests
(map square l)
(append l l2)
(length l)
