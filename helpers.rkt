#lang racket

(define (equal-lists? list1 list2)
  (cond ((and (null? list1) (null? list2)) #t)
        ((or (null? list1) (null? list2)) #f)
        ((= (car list1) (car list2)) (equal-lists? (cdr list1) (cdr list2)))
        (else #f)))

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
