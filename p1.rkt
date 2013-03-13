#lang racket

;; Recursive solution
(define (f n)
  (if (<= n 3)
    n
    (+ (f (- n 1))
       (* 2 (f (- n 2)))
       (* 3 (f (- n 3))))))



;; Iterative solution
(define (fi n)
  (define (f-iter a b c i)
    (if (= i 0)
      a
      (f-iter (+ a (* 2 b) (* 3 c)) a b (- i 1))))
  (if (<= n 3)
    n
    (f-iter 3 2 1 (- n 3))))


;; Tests
(= (f -1) (fi -1))
(= (f 0) (fi 0))
(= (f 1) (fi 1))
(= (f 2) (fi 2))
(= (f 3) (fi 3))
(= (f 4) (fi 4))
(= (f 5) (fi 5))
(= (f 6) (fi 6))
(= (f 20) (fi 20))
