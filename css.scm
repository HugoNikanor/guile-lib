(define-module (css)
               #:export (scss->css))

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
