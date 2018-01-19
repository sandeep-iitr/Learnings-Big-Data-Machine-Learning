
-----
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

-------


;; [Purpose]
;; Returns a list that is the reverse of input
;; [Inputs]
;; L (list) to reverse
;; [Outputs]
;; (list) L reversed
(defun reverse-list (L)
  (cond
        ; Base case: L is nil, so return nil
        ((null L) nil)
        ; Recursive case: append the first element to the rest
        ; of the list called recursively
        ; [!] Watch out: remember what append expects!
        (t (append (reverse-list ( cdr L )) (list ( car L ))))
   )
)


(print ( reverse-list '(A B C (ED))))
((ED) C B A)

----------


;; [Purpose]
;; Replaces the nth element of the given list L
;; with the given list R
;; [Inputs]
;; L (list) to replace element within
;; n (int) index to replace in L
;; R (atom / list) replace L[n] with R
;; [Outputs]
;; (list) L with replacement R
(defun replace-element (L n R)
  (cond
       ; Base case: L is empty, so return nil
       ( (null L)  nil)
      ; Base case: n has reached 0, so we are
      ; at the index in L to place R
      ((= n 0)  (append (list R) ( cdr L ) ) )
      ; Recursive case: L is not empty and n is not 0, so
      ; add the first element of L to our result, and then
      ; recurse on the rest of L and n - 1
      (t (append (list (car L)) (replace-element ( cdr L ) (- n 1) R)))
  )
)


(print ( replace-element '(A B C D) 2 'A ))

Output: (A B A D) 
