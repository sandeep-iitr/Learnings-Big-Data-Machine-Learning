
;; [Purpose]
;; Returns the value of n raised
;; to integer power pow
;; [Inputs]
;; n (number): number to raise to power pow
;; pow (integer): power to raise n to
;; [Output]
;; (number) n ^ pow
(defun power (n pow)
  (cond
        ; Base case: pow is 0, return 1
        ((= pow 0) 1)
        ; If power is positive, we recursively
        ; multiply our result by n
        ((> pow 0) (* n (power n (- pow 1))))
         ; Otherwise, power is negative, so we have
         ; to divide 1 by our result; we make it positive, and call it to the positive case, but final result is divided 
         ; due to initial call
        ((< pow 0) (/ 1 (power n (* pow -1))))
   )
)

; We can run some tests here:
(print (power 10 2))
(print (power 10 -2))
