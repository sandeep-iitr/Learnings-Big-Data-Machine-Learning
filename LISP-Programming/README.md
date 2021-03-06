# Lisp-List-Programming-Language
# 10 - Jan - 2018

## Purpose is to cover the minimal subset of the language LISP
## Various Dialects of LISP, here Common LISP

- Applicative langauage
- Normally interpreted rather than compiled
- LISP program is completely legal lisp datatype
- Functional composition and recursion

## Examples
1. 468
- Numbers normally evaluates to themself
- 468
- Example of atom
2. (+ 137 349)
- This is an expression. Operator first, then a sequence of operators. 
- This evaluated: atom evaulates to itself, and then operator is applied
- 486
- (- 1000 334) : 666
3. (+ 21 35 12 7)
- 75
4. (* 25 4 12)
- 1200
5. (+(*3 5)(-10 6))
- 15 + 4 = 19

## Lisp Expressions
- Either an Atom: eg. 72, or
- (\<Operator\> \<arg1\> \<arg2\>... \<argn\> )
- **1. Its meaning is the value returned when evaluated**
- - Evaluation
- - Evaluate the operator
- - Evaluate each argument
- - Apply the value of the operator to the value of each argument and return the result.
- - Generally evaluated left to right

## defconstant
-(defconstant pi 3.14159)
- Returns: pi
- Now typing: pi
- Returns 3.14159
- Exceptions is: Will not evaluate the first expression
- Value of this expression is **pi**
- Now we can use the symbol **pi** instead of expression
- Used for constants, not for initializing variables
- (\*2 pi)
- 6.28318

## defun: Define Function
; square returns the square of its arguments
(defun square (x)(\* x x))

-> square

- (square 20)

-> 400

- (square (+2 5))

-> 49

- (square(square 3))

-> 81

## Function Evaluation
1. Evaluate each argument
2. Bind the values of the arguments in the form parameters
3. Evaluate the body of the function in the binding context and return the result.

## Comments
; sum-of-squares returns sum of squares of its two arguments

(defun sum-of-squares(x y)

  (+ (square x) (square y))
  )

returns: sum-of-squares

- (sum-of-squares 3 4)
- 25

## absolute value function
; abs returns absolute value of the function


    (defun abs (x)

       cond ((> x 0) x)

            ((= x 0) 0)
            ((< x 0) (- x)))

    abs

### cond clause
    (cond (\<predicate\> \<body\>)
          (\<predicate\> \<body\>)
          ....
    )
    
    Predicate: is a function that return True or null or ()
    Null and () are same thing and equivalent to false.
    
-(abs (-10))

    (> -10 0) evaluates to the null
    (= 10 0)  evaluates to null, and last evaluates to true, and value is returned
    
    
## OR operator
   
    (defun abs (x)
     (cond ((or (> x 0)(= x 0) x )
           (+ (- x)) ) )
  
  - Evaluation happens in order
  - Cond returns when the first predicate evaluates to true.
  - The last part of the cond can be true, so it is always evaluated to this value if all predicates evaluates to false
  
## More Examples

    ;Odd takes non negative integer and returns t if and only if it is odd
    ; We will use recursion: base case and general case, here base case is 0 and 1
    ; In base case of 0 in recursion return nil
    (defun odd (x) 
     (cond ((= x 0) nil)
           ((= x 1) T)
           (T (odd (- x 2)))))

---
     
     (odd 0)
      nil
      
     (odd 1)
      T
      
     (odd 2)
      ;recursive calls: odd x-2 and odd 0 = nil
      nil
---
      ;Negative input will give us stack overflow. Will enter into infinite loop
      

## Factorial
    ;fact takes a non-negative integer x and return x factorial (x!)
    (defun fact (x)
     (cond ((= x 0) 1)
           (T (* x (fact(- x 1))))))
           
---
    fact 3
     * 3 fact 2
              2 * fact 1
                       1 * fact 0
                                1
---
    fact 3
     * 3 fact 2
              2 * fact 1
                       1 * 1
---
    fact 3
     * 3 fact 2
              2 * 1
---              
    fact 3
     * 3 2
     
                         
## Lists
Any balanced parenthesized expression
- () list containing nil
- (1 2) list of 2 elements.
- (A (bc) (D) (E (FG))) list of 4 elements.
- Almost all LISP Programs. Example function fact is list of 4 elements

### Selectors
    ( car (A B C))
    ;car is normally first element of the list
    ;car is built in function.
    ;It evaluates the argument A as operator on B and C
    ;Gives error of sort: unbound symbol A
---     
    ;To remove error
    ( car '(A B C))
    Returns: A
    ( car quote(A B C))
    Returns: A
    
    ;Quote is a special operator, it simply returns it argument not evaluted. It returns the list (A B C) and car now returns the first element
---     
    (cdr (A B C))
    Returns error
    
    (cdr '(A B C))
    Returns (B C)
    ;removes the first element in the list
---     
    (car (cdr '(A B C)))
    Returns: B
    
--- 
    (cadr '(A B C))
    Returns B
    
---
    (car ' (cdr '(A B C)))
    What happens?
     (car ' (cdr '(A B C)))
     
     quote will not evaluate anything inside, and it will return it as a list of two elements
     (cdr '(A B C))
     and car now returns the: cdr
---
    (car ' (cdr (A B C)))
    Also returns: cdr
    Outer quote forces not evaluation
    
### cons with quote and few other selectors for list
    (cons  'A '(B C))
     Returns: (A B C)
--- 
    In general
    (cons (car x) (cdr x) ) = x
---
    (list 'A 'B)
     Returns: (A B)
---
     (append '(A B) '(B C))
     Returns: (A B B C)
     
 
 ## Predicates
 ---
     (atom 'A)
     Returns: T
     
     (atom '(A))
     Return: nil
     
     (atom ())
     ;we don't need a quote here, we can put it. nil evaluates to itself. nil is both a list or atom
     Returns: T
     
     (null nil)
     ;tells if argument is nil or not
     Returns: T
     
     (null '(()))
     ;returns nil, as argument is not nil, it is list containing nil
     Returns: nil
     
     (equal '(A B) '(A B))
     Returns: T
     
     (equal () '(()))
     Returns: nil
     
  -----
  ## More Function Examples
  ### Last 
  Returns the last top level element of its argument list. See *TopLevel*
  
      (defun last(x)
       (cond (( null (cdr x) (car x))
             (T (last (cdr x)))))
             
        ; we don't put quote on the x, because then the value of x will be x itself
        
---
     (last '(A B C)) ; this is what will happen under the hood
      (last (B C)) ;it is being evaluated now, so no quotes shown
       (last (C))
        C
        
---
Length: return the length of the number of top level arguments of its argument list
         
    (defun length(x)
     (cond (( null x) 0)
           (T (+ 1 (length(cdr x))))))
          
         
         
      (lenght '(B C))
      (+1 length(C))
      (+ 1 (+ 1 0))
      (+ 1 1 )
      2
      
- Return the nth element of the list
- Return is a element is member of the list
- Return the total number of atoms in the list
        
