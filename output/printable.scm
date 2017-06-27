(define-module (output printable)
               #:use-module (ice-9 format)
               #:export (define-printable))

;;; TODO
;;; This currently doesn't work with functions which have rest terms

;; Makes a function which displays a signature of itself whenever it's called"
;; Alsa, docstrings didn't work on define-syntax
(define-syntax define-printable
  (syntax-rules ()
    ((_ (name args ...)
        body)
     (define-printable (name args ...)
       #f body))
    ;; This works because only the last expression can return
    ;; so it doesn't matter if the first expression is a docstring or not
    ;; but if it is then we capture it
    ((_ (name args ...)
        docstring?
        body ...)
     (define (name args ...)
       docstring?
       (let ((return-value (begin body ...)))
         ;; Note that function-name keeps being the original binding
         ;; for the function, this can cause problems on rebinding.
         (format #t "~s :: ~s => ~s\n"
                 (cons (procedure-name name)
                       `(args ...))
                 (list args ...)
                 return-value)
         return-value)))))
