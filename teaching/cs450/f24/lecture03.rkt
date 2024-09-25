#lang racket
(require rackunit)

(define (point x y z)
  (cons x (cons y (cons z empty))))

(define (point_2 x y z)
  (list x y z))

(define (point? p)
  (and
    (list? p)
    (equal? (length p) 3)
  )
)

(define (point-x p)
  (first p)
)
(define (point-y p)
  (second p)
  ; (first (rest p))
)
(define (point-z p)
  (third p)
)

(define (origin? p)
  (equal? p (list 0 0 0))
)

(define p (point 1 2 3))
(check-true (point? p))
(check-equal? (list 1 2 3) p)
(check-equal? 1 (point-x p))
(check-equal? 2 (point-y p))
(check-equal? 3 (point-z p))
(check-true (origin? (list 0 0 0)))
(check-false (origin? p))

(define code
  (quote
    (
      (define (f x) 10)
      (+ x 100)
      (if )
    )
  )
)

;(displayln code)
(displayln (length code))
(define def-x-10 (first code))
(define plus-x-100 (second code))
(displayln def-x-10)
(displayln plus-x-100)

(equal? (first def-x-10) 'define)
; ( define identifier expression )
(define (define-basic? node)
  (and
    (list? node)
    (equal? (length node) 3)
    (equal? (first node) 'define)
    (symbol? (second node))
  )
)










