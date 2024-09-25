#lang racket


(define (copy l)
  (match l
    ; If list is empy
    ; Input: l = (list)
    ; Output: (list)
    [(list) (list)]
    ; [(cons h l) ...]
    [(list h t ...)
      ; Input: (list 1 2 3) = l
      ; Expected output: (list 1 2 3)
      ; h = 1
      ; t = (list 2 3)
      ; (theoretical)
      ; result = (copy (list 2 3)) = (list 2 3)
      ;
      ; Input: (list 2 3) = l
      ; Expected output: (list 1 2 3)
      ; h = 2
      ; t = (list 3)
      ; (theoretical)
      ; result = (copy (list 3)) = (list 3)
      ;
      ; Input: (list 3) = l
      ; Expected output: (list 1 2 3)
      ; h = 3
      ; t = (list)
      ; (theoretical)
      ; result = (copy (list)) = (list)
      ;

      (define result (copy t))
      (cons h result)
    ]
  )
)
#|

new_l = []

for h in l:
  new_l.append(h)

|#
;(copy (list 1 2 3 4))

(define (mult-2 l)
  (match l
    ; Input = (list)
    ; Output = (list)
    [(list) (list)]
    [(list h t ...)
      ;(displayln h)
      ;(displayln t)
      ; l = (list 1 2 3)
      ; h = 1
      ; t = (list 2 3)
      (define result (mult-2 t))
      ;(display "result: ") (displayln result)
      ; result = (mult2 (list 2 3)) = (list 4 6)
      ; Output: (list 2 4 6)
      (cons (* h 2) result) ; (list 1 4 6)
    ]
  )
)
#|

new_l = []
for h in l:
    new_l.append(2 * h)
return new_l
|#


;(mult-2 (list 1 2 3))


(define (sum l)
  (match l
    [(list)
      ; Input: (list)
      ; Output: 0
      0
    ]
    [(list h t ...)
      ; l = (list 1 2 3)
      ; h = 1
      ; t = (list 2 3)
      (define result (sum t))
      ; result = (sum (list 2 3)) = 5
      ; Expected output: (1 + 2 + 3) = 1 + 5 =6
      (+ h result)
    ]
  )
)

;(sum (list 1 2 3 5 6 7 8 9 10))


(define (count-down n)
  (cond [(<= n 0)
          ; n = 0
          ; output: (list)
          (list)
        ]
        [else
          ; n = 3
          (define result (count-down (- n 1)))
          ; result = (list 2 1)
          ; expected output: (list 3 2 1)
          (cons n result)
        ]
  )
)

;(count-down 3)

(define (pair x y)
  (list x y)
)

(define (zip l1 l2)
  (match* (l1 l2)
    [((list) dontcare) (list)]
    [(dontcare (list)) (list)]
    [( (list h1 l1 ...) (list h2 l2 ...)  )
      ; Input: [a, b, c] [x, y, z]
      ; h1 = a
      ; l1 = [b, c]
      ; h2 = x
      ; l2 = [y, z]
      (define result (zip l1 l2))
      ; result = (zip [b, c] [y, z]) = [ [b, y], [c, z] ]
      ; expected output: [ [a, x], [b, y], [c, z] ]
      ;                            ----- result --
      (cons
        (pair h1 h2)
        result
      )
    ]
  )
)

(zip '(a b c) '(x y z))


















