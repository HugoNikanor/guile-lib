(define-module (macros define-multiple)
               #:use-module (srfi srfi-1)
               #:use-module (srfi srfi-8)
               #:export (define-multiple let-multiple))

(define-macro (define-multiple bindings expr)
  "Allows binding of multiple variables at once.
   usage:
   (define-multiple (x y) '(1 2))
   x y
   => 1
   => 2
   "
  (let ((symb (gensym)))
    `(begin
       (define ,symb ,expr)
       .  ,(map (lambda (n)
                  `(define ,(list-ref bindings n)
                     (list-ref ,symb ,n)))
                (iota (length bindings))))))

(define-syntax let-multiple
  (syntax-rules ()
    ((_ bindings expr
        body ...)
     (receive bindings (apply values expr)
              body ...))))


