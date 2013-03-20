#lang racket
;; Exercise 2.33

(require "helpers.rkt")

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
(define l1 '(1 2 3 4 5))
(define l2 '(6 7 8 9 10))

(map square l1)
(append l1 l2)
(length l1)
