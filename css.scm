(define-module (css)
               #:export (scss->css))

;;; This module is compleatly broken.
;;; It should probably be removed from my collection of
;;; simple guile moduules. Since it's both just a simple
;;; sexp -> css converter, but if I add an css -> sexp
;;; then it gets to large, and would be better of as its
;;; own proper module.

(define* (->string displayable
            #:optional (dispfunc display))
  (with-output-to-string
    (lambda ()
      (dispfunc displayable))))

(define (declaration->string decl)
  (string-append (car decl)
                 ": "
                 (->string (cadr decl))
                 ";"))

(define (sruleset->string ruleset)
  (string-append
    (car ruleset)
    " { "
    (string-join (map declaration->string
                      (cdr ruleset))
                 " ")
    " }"))

(define* (scss->css struct #:optional (nl "\n"))
         "Turns a structure on the form 
         ((selector
            (attribute value)))
         into css"
         (string-append nl
                        (string-join
                          (map sruleset->string struct)
                          nl)
                        nl))
