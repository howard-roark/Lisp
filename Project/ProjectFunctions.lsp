;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;     Matthew McGuire                                                          ;
;     CS 3210 LISP Project: Building a House                                   ;
;     Turn in date: 16 September 2014                                          ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;	1. sum function to take list of tasks and return sum of days needed to
;		comlete the tasks
(defun sum (L)
  (cond ((NULL L) 0)
        (T (+ (cadar L) (sum (cdr L))))))

;	2.predecessors function to return all tasks that need to be completed before
;		the task passed into the function.
(defun predecessors (Task L)
  (cond ((NULL L) NIL)
        (T (cond ((eq (caar L) Task) (cddar L))
                 (T (predecessors Task (cdr L)))))))

;	3. gettime function to return the amount of time a specific task will take
;		out of a given list of tasks.
(defun getTime (Task L)
  (cond ((NULL L) NIL)
        (T (cond ((eq (caar L) Task) (cdar L))
                 (T (getTime Task (cdr L)))))))

;	4. get_all_preds function to take a specific task and list of tasks and then
;		return a list of all the tasks that need to be completed before the
;		passed in task can be started.
(defun get_all_preds (Task Tasks AllTasks)
  (cond ((NULL Tasks) NIL)
        (T (cond ((eq (caar Tasks) Task)
                  (remove-duplicates
                    (build_all_preds_list (cddar Tasks) AllTasks)))
                 (T (remove-duplicates
                      (get_all_preds Task (cdr Tasks) AllTasks)))))))

;	Helper function for get_all_preds to build a list of all required tasks
;		based on the original list of predecessors
(defun build_all_preds_list (Tasks AllTasks)
  (cond ((NULL Tasks) NIL)
        (T (cond ((NULL (cdr Tasks))
                  (append Tasks (predecessors (car Tasks) AllTasks)))
                 (T (append Tasks (predecessors (car Tasks) AllTasks)
                            (build_all_preds_list (cdr Tasks) AllTasks)))))))