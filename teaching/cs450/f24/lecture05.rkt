#lang racket
; (exact-floor x)


(define (list-exact-floor l)
  (match l

    [(list)
      ; Input: []
      ; Output: []
      (list)
    ]
    [(list h l  ...)
      ; Input: (list 1.1 2.6 3.0)
      ; h = 1.1
      ; l = (list 2.6 3.0)
      (define result (list-exact-floor l))
      ; result = (list-exact-floor (list 2.6 3.0)) = (list 2 3)
      ; Expected output: (list 1 2 3)
      (define x (exact-floor h)) ; x = 1
      (cons x result)
    ]
  )
)

;(list-exact-floor (list 1.1 2.6 3.0))

(define (float-to-string f)
  (format "~a" f))

;(float-to-string 1.0)

(define (map function-param l)
  (match l
    [(list)
      ; Input: []
      ; Output: []
      (list)
    ]
    [(list h l  ...)
      ; Input: (list 1.1 2.6 3.0)
      ; h = 1.1
      ; l = (list 2.6 3.0)
      (define result (map function-param l))
      ; result = (list-exact-floor (list 2.6 3.0)) = (list 2 3)
      ; Expected output: (list 1 2 3)
      (define x (function-param h)) ; x = 1
      (cons x result)
    ]
  )
)

;(map float-to-string (list 1.1 2.6 3.0))

#|
(define (rec l)
  (match l
    [(list) base-case]
    [(list h l  ...)
      ; Input: (list 1.1 2.6 3.0)
      ; h = 1.1
      ; l = (list 2.6 3.0)
      (define result (rec l))
      ; result = (list-exact-floor (list 2.6 3.0)) = (list 2 3)
      ; Expected output: (list 1 2 3)
      (next-element h result)
      ; (+ h result)
    ]
  )
)
|#

(struct point (x y z) #:transparent) ; transparent implements to-string

(define p (point 1 2 3))
;; (displayln p)
;; (displayln (format "[x=~a, y=~a, z=~a]"
;;   (point-x p)
;;   (point-y p)
;;   (point-z p)
;; ))

(struct name (first middle last)  #:transparent)

(define n (name "Tiago" "C" "Garcia"))

(define (print x)
  (match x
    [(point x y z) (displayln (format "[x=~a, y=~a, z=~a]" x y z))]
    [(name f m l) (displayln (format "Hello, ~a ~a ~a" f m l))]
    [_ (displayln "unknown!")]
  )
)

(print p)
(print n)


;(displayln n)
;(name? p)












