;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;     Matthew McGuire                                                          ; 
;     CS 3210 LISP Functions                                                   ; 
;     Turn in date: 8 September 2014                                           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; 1.) deleteAt - Function to delete an element from a list whose location in
;       the list is the Index passed in.
(defun deleteAt (L Ind)
  (cond ((= Ind 0) (cdr L))
        (T (cons (car L) (deleteAt (cdr L) (- Ind 1))))))

; 2.) deleteAtALl - Function to delete elements from a list whose locations
;       are the indeces passed in.
(defun deleteAtAll (L &rest Inds)
  (cond ((NULL L) L)
        (T (cond ((NULL Inds) L)
                 (T (deleteAtAllLists L Inds))))))


; Helper function for deleteAtAll
(defun deleteAtAllLists (L Inds)
  (cond ((NULL L) L)
        (T (cond ((NULL Inds) L)
                 (T (cond ((= (car Inds) 0)
                           (deleteAtAllLists (cdr L) (decrementAll (cdr Inds))))
                          (T (cons (car L)
                                   (deleteAtAllLists (cdr L)
                                                     (decrementAll Inds))))))))))

;Function to decrement all indices in a list by 1, helper for deleteAtAll
(defun decrementAll (L)
  (cond ((Null L) NIL)
        (T (cons (- (car L) 1) (decrementAll (cdr L))))))

; 3.) sumAll - Function to return sum of all arguments passed in
(defun sumAll (&rest nums)
  (sumAllList nums))

; Helper function to be able to use list for recursion in sumAll problem
(defun sumAllList (nums)
  (cond ((NULL nums) 0)
        (T (cond ((listp (car nums))
                  (sumAllList (cons (eval (car nums)) (cdr nums))))
                 (T (+ (car nums) (sumAllList (cdr nums))))))))

; 4.) similar - Function to take 2 lists as arguments and return list of
;       similar items
(defun similar (LOne LTwo)
  (cond ((NULL LOne) NIL)
        (T (cond ((NULL LTwo) NIL)
                 (T (cons (iterateLTwo (car LOne) LTwo)
                          (similar (cdr LOne) LTwo)))))))

; Helper function for 4 to iterate through list two and will compare
;   with car of LOne to return match if it exists.
(defun iterateLTwo (carLOne LTwo)
  (cond ((NULL LTwo) NIL)
        (T (cond ((equal carLOne (car LTwo)) carLOne)
                          (T (iterateLTwo carLOne (cdr LTwo)))))))

; 5.) alone - function to return all the elements in 2 lists that do not have
;       a match in the other list
(defun alone (LOne LTwo)
  (cond ((NULL LOne) NIL)
        (T (cond ((NULL LTwo) NIL)
                 (T (similar (aloneCompare LOne LTwo)
                          (aloneCompare LTwo LOne)))))))

; Helper function to compare the two lists passed into the alone function
(defun aloneCompare (LOne LTwo)
  (cond ((NULL LOne) NIL)
        (T (cond ((NULL LTwo) NIL)
                 (T (cond ((not (equal
                                (car LOne)
                                (car (aloneCompare (car LOne)
                                                   (car LTwo))))))
                           (cons (car LOne)))
                          (T (cond
                               ((not (equal
                                       (cadr LOne) (cadr
                                                      (aloneCompare
                                                        (cadr LOne)
                                                        (cadr LTwo)))))))))))))
                           
                           
                           
                           
                           
; 6.) lastElement - return the last element of a list
(defun lastElement (L)
  (cond ((NULL L) NIL)
        (T (cond ((NULL (cdr L)) (car L))
                 (T (lastElement (cdr L)))))))

; 7.) mcons - cons any amount / type of argument to a new list