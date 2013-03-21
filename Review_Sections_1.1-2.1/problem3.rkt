#lang racket
;; Problem 3

;; Define a procedure reverse that takes a list as argument and returns a list
;; of the same elements in reverse order:
;;
;; Also write a deep-reverse procedure that takes a list as argument and
;; returns as its value the list with its elements reversed and with all
;; sublists deep-reversed as well. For example,

(require "../helpers.rkt")

;; Reverse
(define (reverse seq)
  (define (reverse-iter in-list out-list)
    (if (null? in-list)
      out-list
      (reverse-iter (cdr in-list) (cons (car in-list) out-list))))
  (reverse-iter seq nil))

;; Deep reverse
(define (deep-reverse seq)
  (define (deep-reverse-iter in-list out-list)
    (cond ((null? in-list) out-list)
          ((not (pair? in-list)) in-list)
          (else (deep-reverse-iter (cdr in-list)
                                   (cons (deep-reverse-iter (car in-list) nil)
                                         out-list)))))
  (deep-reverse-iter seq nil))

;; Tests
(equal-lists? (reverse (list 1 4 9 16 25))
              (list 25 16 9 4 1))

;; Should be '((4 3) (2 1))
(let ((nested-list (deep-reverse (list (list 1 2) (list 3 4)))))
  (and (equal-lists? (car nested-list) (list 4 3))
       (equal-lists? (cadr nested-list) (list 2 1))))
