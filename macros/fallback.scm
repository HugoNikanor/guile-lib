(define-module (macros fallback)
  #:export (empty-alt))

;; Returns list if not null, else returns fallback
(define-macro (empty-alt list fallback)
 `(if (null? ,list)
   ,fallback
   ,list))
