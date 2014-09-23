; π;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;     Matthew McGuire                                                          ;
; ;     CS 3210 LISP Project: Building a House                                   ;
; ;     Turn in date: 16 September 2014                                          ;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
(defun get_time (Task L)
  (cond ((NULL L) NIL)
        (T (cond ((eq Task (caar L)) (cadar L))
                 (T (get_time Task (cdr L)))))))

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
  (find_start_day (predecessors task Tasks) Tasks))

; Helper function for start_day
(defun find_start_day (Preds AllTasks)
  (cond ((NULL Preds) 1)
        (T (max (+ (get_time (car Preds) AllTasks)
                   (find_start_day (predecessors (car Preds) AllTasks) AllTasks))
                (find_start_day (cdr Preds) AllTasks)))))

; 7. get_max function to take a list of tasks and all tasks and returns a list
;   with the job that takes the longest and the amount of time it will take.
(defun get_max (Tasks AllTasks)
  (cond ((NULL Tasks) NIL)
        (T (greater_than (list (start_day (car Tasks) AllTasks) (append (car Tasks)))
                         (get_max (cdr Tasks) AllTasks)))))

; Helper for comparing number of days needed for two tasks
(defun greater_than (L1 L2)
  (cond ((NULL L1) L2)
        ((NULL L2) L1)
        (T (cond ((> (car L1) (car L2)) L1)
                 (T L2)))))

; 8. critical_path finds the time a job can get done in the least amount of time
;   and returns a list of preceding tasks that need to get done first.
(defun critical_path (Task Tasks))

; 9. depends_on function which takes a task and list of all tasks and determines
;   which tasks need to wait for the initial task passed in.
(defun depends_on (Task Tasks))


