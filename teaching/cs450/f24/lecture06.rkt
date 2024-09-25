#lang racket
(struct pair (left right) #:transparent)



;; Exercise 1.a
(define (pair-set-left p l)
  (display "p = ") (displayln p)
  (display "l = ") (displayln l)
  (match p
    ; x = p.left = (pair-left p)
    ; y = p.right = (pair-right p)
    [(pair x y)
     (pair l y)
    ]
  )
)
(define p1 (pair 1 2))

;(pair-set-left p1 "foo")



(define (print-pairs p1 p2)
  (define (print-pair l r)
    (display "left = ")(display l)(display ", right = ")(displayln r)
  )
  (match* (p1 p2)
    [((pair x1 y1) (pair x2 y2))
      (display "p1: ")(print-pair x1 y1)
      (display "p2: ")(print-pair x2 y2)
    ]
  )
)
;(print-pairs (pair 1 2) (pair 3 4))

(define (sum l)
  (match l
    [(list) ; input = '()
      (displayln "input = ()")
      (displayln "output = 0")
      0]    ; expected output = 0
    [(list h l ...) ; input = '(1 2 3 4)
      ; h = 1
      (display "h = ")(displayln h)
      ; l = '(2 3 4)
      (display "l = ")(displayln l)
      ; result = (sum (list 2 3 4)) = 2 + 3 + 4 = 9
      (define result (sum l))
      (display "result = ")(displayln result)
      (+ h result)
      ])) ; expected output = (+ 1 9) = 10

;(sum (list 1 2 3))
#|
(sum (list 1 2 3))
h = 1
l = (2 3)
    (sum (list 2 3))
    h = 2
    l = (3)
        (sum (list 3))
        h = 3
        l = ()
            (sum (list))
            input = ()
            output = 0
        result = 0
    result = 3
result = 5
6
|#

;;;;;;;;;;;;;;;;;;;; END OF HOMEWORK RECAP ;;;;;;; NEXT IS LEC 6 ;;;;;;;;;

(define x 10)
(define (f x)
  (+ x 20))
;(f 30) ; 50

(define g (lambda (x) (+ x 20)))
;(g 30) ; 50

(define (factory k)
  (lambda () k))

(define factory1 (factory 10)) ; (lambda () 10)
(define factory2 (factory "foo")) ; (lambda () "foo")

; (factory1) ; 10
; (factory2) ; "foo"

(define fifty (g 30))

(define (add1 k)
  (lambda () (+ k fifty)))

(define a1 (add1 10)) ; (lambda () (+ 10 50))
; (a1) ; 60

(define (build2 a b)
  (define (func)
    (list a b))
  func
)

(define p-xy (build2 "x" "y"))

; (p-xy) ; (list "x" "y")


(define (example-slide-9 x y)
  (lambda (b)
    (if b
      ; then
      x
      ; else
      y
    )
  )
)
(define e-1-2 (example-slide-9 1 2)) ; (lambda (b) (if b 1 2))
;e-1-2 ; procedure

;; (display "(e-1-2 #t) = ")(e-1-2 #t) ; (e-1-2 #t) = 1
;; (display "(e-1-2 #f) = ")(e-1-2 #f) ; (e-1-2 #f) = 2

; (string-append "Hello " ", world")

(define (debug label x)
  (display (string-append label " = "))
  (write x)
  (displayln "")
)

(define (string-concat l)
  (match l
    [(list) ""]
    [(list h l ...)
      ; Input: (list "Hello" ", " "world" "!")
      ; h = "Hello "
      (debug "h" h)
      ; l = (list ", " "world" "!")
      (debug "l" l)
      (define result (string-concat l))
      ; result = (string-concat (list ", " "world" "!")) = ", world!"
      (debug "result" result)
      ; Expected output: "Hello, world!"
      (string-append h result)
    ]
  )
)

(string-concat (list "Hello" ", " "world" "!"))























