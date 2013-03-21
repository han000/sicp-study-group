#lang racket
;; Exercise 2.33

(require "../helpers.rkt")

(define (map proc sequence)
  (accumulate (lambda (x y) (cons (proc x) y))
                nil
                sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))


;; Tests
(equal-lists? (list 2 4 6 8)
              (map (lambda (x) (* x 2)) (list 1 2 3 4)))
(equal-lists? (list 1 2 3 4 5 6)
              (append (list 1 2 3) (list 4 5 6)))
(= 3
   (length (list 4 5 6)))
