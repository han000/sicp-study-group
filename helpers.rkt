#lang racket

(define equal-lists? equal?)

(define (square x)
  (* x x))

(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (enumerate-interval a b)
  (if (> a b)
    nil
    (cons a (enumerate-interval (+ a 1) b))))

(define (flatmap proc seq)
  (accumulate append
              nil
              (map proc seq)))

(define (prime? x)
  (define (prime-iter curr)
    (cond ((< x 2) #f)
          ((> (square curr) x) #t)
          ((= 0 (remainder x curr)) #f)
          (else (prime-iter (+ curr 1)))))
  (prime-iter 2))

;; Provide
(provide equal-lists?
         square
         nil
         accumulate
         enumerate-interval
         flatmap
         prime?)
