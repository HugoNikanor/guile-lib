(define-module (math sum-prod)
               #:use-module (srfi srfi-1)
               #:export (prod sum))

(define (range a b)
  "[a, b]"
  (iota (- (1+ b) a) a))

(define-syntax common
  "Common logic between sum and prod"
  (syntax-rules ()
    ((_ var from to expr)
     (map (lambda (var) expr)
          (range from to)))))

(define-syntax prod
  "(prod (k = 1) 5 (* k 2))
  -> (* (* 1 2) (* 2 2) (* 3 2) (* 4 2) (* 5 2))"
  (syntax-rules (=)
    ((_ (var = from) to expr)
     (apply * (common var from to expr)))))

(define-syntax sum
  "(sum (k = 1) 5 (* k 2))
  -> (+ (* 1 2) (* 2 2) (* 3 2) (* 4 2) (* 5 2))"
  (syntax-rules (=)
    ((_ (var = from) to expr)
     (apply + (common var from to expr)))))
