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
(defun similar (Lone Ltwo)
  (cond ((NULL Lone) NIL)
        (T (cond ((NULL Ltwo) NIL)
                 (T (cons (iterateLtwo (car Lone) Ltwo)
                          (similar (cdr Lone) Ltwo)))))))

; Helper function for 4 to iterate through list two and will compare
;   with car of Lone to return match if it exists.
(defun iterateLtwo (carLone Ltwo)
  (cond ((NULL Ltwo) NIL)
        (T (cond ((listp (car Ltwo)) (iterateLtwo carLone (cdr Ltwo)))
                 (T (cond ((string-equal carLone (car Ltwo)) carLone)
                          (T (iterateLtwo carLone (cdr Ltwo)))))))))

; 5.) alone - 


; 6.) lastElement - return the last element of a list
(defun lastElement (L)
  (cond ((NULL L) NIL)
        (T (cond ((NULL (cdr L)) (car L))
                 (T (lastElement (cdr L)))))))

; 7.) mcons - cons any amount / type of argument to a new list