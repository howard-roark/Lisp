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
(defun get_all_preds (Task Tasks)
  (cond ((NULL Tasks) NIL)
        (T (remove-duplicates
             (append (predecessors Task Tasks)
                     (rest_of_preds 
                       (predecessors Task Tasks) Tasks))))))

; Helper function for 4 to build a list of all the predecessors for a given task
(defun rest_of_preds (Preds Tasks)
  (cond ((NULL Preds) NIL)
        (T (append
             Preds (rest_of_preds
                     (append (cdr Preds)
                             (predecessors (car Preds) Tasks)) Tasks)))))

; 5. precedes function to take 2 tasks and the list of all tasks and return true
;   if the first task is necessary to complete the second, nil otherwise.
(defun precedes (TaskOne TaskTwo Tasks)
  (cond ((member TaskOne (get_all_preds TaskTwo Tasks)) T)
        (T NIL)))

; 6. start_day function to take a specific job, a list of tasks and returns the
;   day that the specific job can started (+2: assuming cannot start job until
;   all others are completely finished, and counting from 1 not 0)
(defun start_day (Task Tasks)
  (+ 2 (sum (build_list_of_days (get_all_preds Task Tasks) Tasks Tasks))))

; Helper function for 6 to build list of days for sum function out of the list
;   of all predecessors and the original list of tasks.
(defun build_list_of_days(Preds Tasks AllTasks)
  (cond ((NULL Preds) NIL)
        (T (cond ((eq (car Preds) (caar Tasks))
                  (cons (car Tasks)
                        (build_list_of_days (cdr Preds) AllTasks AllTasks)))
                 (T (build_list_of_days Preds (cdr Tasks) AllTasks))))))

; 7. get_max function to take a list of tasks and the entire list of tasks and
;   return the task that will take longest to compelte.


; 8. critical_path takes a job and he list of tasks and returns a list of the
;   the jobs needed to be completed to get the original job done in the least
;   amount of time
(defun critical_path (Task Tasks)
  (find_critical_path (predecessors Task) Tasks Tasks))

; Helper function to determine critical path
(defun find_critical_path (FirstPreds Tasks AllTasks)
  (cond ((NULL FirstPreds) NIL)
        (T (cond ((not (NULL )))))))






