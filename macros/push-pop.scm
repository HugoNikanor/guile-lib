(define-module (macros push-pop)
  #:export (push! pop!))

(define-macro (push! el lst)
  `(set! ,lst (cons ,el ,lst)))

(define-macro (pop! lst)
 `(if (null? ,lst)
   ()
   (let ((return (car ,lst)))
    (set! ,lst (cdr ,lst))
    return)))
