#lang racket

(define ex1
  (+
    (+
      (* 11 15)
      (+ 14 4)
    )
    (-
      (/ 3 9)
      (* 14 3)
    )
  )
)

(define ex2
  (list
    (+
      (+
        (* 11 15)
        (+ 14 4)
      )
      (-
        (/ 3 9)
        (* 14 3)
      )
    )
    ; step1
    (+
      (+
        165
        (+ 14 4)
      )
      (-
        (/ 3 9)
        (* 14 3)
      )
    )
    ; step 2
    (+
      (+
        165
        18
      )
      (-
        (/ 3 9)
        (* 14 3)
      )
    )
    ; step 3
    (+
      183
      (-
        (/ 3 9)
        (* 14 3)
      )
    )
    ; step 4
    (+
      183
      (-
        1/3
        (* 14 3)
      )
    )
    ; step 5
    (+
      183
      (-
        1/3
        42
      )
    )
    ; step 6
    (+
      183
      -125/3
    )
    ; step 6
    424/3
  )
)



(define pi 3.14159)

;(displayln (format "pi = ~a" pi))

;(displayln (* pi 2))


;(displayln ex2)
;(displayln (list 1 2 3 4 ))

(define circumference (lambda (radius) (* 2 3.14159 radius)))
(define (circumference2 radius) (* 2 3.14159 radius))


(circumference 10)
(circumference2 10)























#|
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define ex1
(+
  (+ (* 11 15)   (+ 14 4))

  (- (/ 3 9) (* 14 3))
)
)

(define ex2
  (list
    (+
      (+ (* 11 15)   (+ 14 4))

      (- (/ 3 9) (* 14 3))
    )
    ; step 1
    (+
      (+ 165 (+ 14 4))

      (- (/ 3 9) (* 14 3))
    )
    ; step 2
    (+
      (+ 165 18)

      (- (/ 3 9) (* 14 3))
    )
    ; step 3
    (+
      183

      (- (/ 3 9) (* 14 3))
    )
    ; step 4
    (+
      183
      (-
        1/3
        (* 14 3)
      )
    )
    ; step 5
    (+
      183
      (-
        1/3
        42
      )
    )
    ; step 5
    (+
      183
      -125/3
    )
  )
)
; ex2

(define pi 3.14159)
; pi
; (* pi 2)

;(void? (void))
; (void)
; (define pi 3.141) ; <--- error
;(define old-sin sin)
;(define sin 10)
;
;(old-sin (+ 1 sin))
(define n 16)
(cond [(equal? (modulo n 15) 0)
      "fizzbuzz"
      ]
      [(equal? (modulo n 3) 0)
        "fizz"
      ]
      [(equal? (modulo n 5) 0)
        "buzz"
      ]
      [else n]
)
|#
