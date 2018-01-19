
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




