(define-module (output line)
               #:export (displayln writeln))

(define (higher-order-show show-func data port)
  "Higher order help function to allow writeln
  and displayln to be as simple as possible"
  (if port
    (begin
      (show-func data port)
      (newline port))
    (begin
      (show-func data)
      (newline))))

(define* (writeln data #:optional (port #f))
         "Like write, but with a newline at the end"
         (higher-order-show write data port))
(define* (displayln data #:optional (port #f))
         "Like display, but with a newline at the end"
         (higher-order-show display data port))
