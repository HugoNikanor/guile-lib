(define-module (macros loop-check)
               #:export (loop-check))

(read-enable 'hungry-eol-escapes)

(define-macro (loop-check declaration until . body)
  "Set value specified in declaration and loop until \
   \nthe until clause is true. When it's true return \
   \nthe last value \
   \n\
   \n(loop-check \
   \n  (line (read-line)) \
   \n  (eof-object? line) \
   \n  (displayln line)) \
   \n=> #<eof>"
  (let ((loop (gensym))
        (return (gensym))
        (symb (car declaration)))
    `(call/cc (lambda (,return)
                (let ,loop ()
                  (let (,declaration)
                    (if ,until
                      (,return ,symb)
                      (begin ,@body
                             (,loop)))))))))
