;;; Refer to guile documentation for usage

(define-module (macros doto)
  #:export (-> ->>))

(define-macro (-> object . functions)
 (define (inner done funs)
  (if (null? funs)
   done
   (let ((statement (car funs)))
    (inner
     (if (list? statement)
      (cons* (car statement) done (cdr statement))
      (list statement done))
     (cdr funs)))))
 (inner object functions))

(define-macro (->> object . functions)
 (define (inner done funs)
  (if (null? funs)
   done
   (let ((statement (car funs)))
    (inner
     (if (list? statement)
      (append statement (list done))
      (list statement done))
     (cdr funs)))))
 (inner object functions))
