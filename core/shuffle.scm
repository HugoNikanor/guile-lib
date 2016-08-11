(define-module (core shuffle)
  #:export (shuffle))
;; note that this runs in (1+ moves) steps
(define (primitive-shuffle lst moves)
 (letrec ((len (length lst))
          (inner (lambda (lst count)
                         ;; this makes sure that 'head
                         ;; doesn't become an empty list
                  (let* ((pos (1+ (random (1- len))))
                         (head (list-head lst pos))
                         (tail (list-tail lst pos))
                         ;; reversing head and tail here causes
                         ;; the whole list to flip every move,
                         ;; this might shuffle it more
                         (lst (append (cons (car tail) (cdr head))
                                      (cons (car head) (cdr tail)))))
                   (if (zero? count)
                    lst
                    (inner lst (1- count)))))))
  (inner lst moves)))

(define (shuffle lst)
  (if (<= (length lst) 1)
  lst
  (let* ((len (length lst))
         (times (+ len (random len))))
   (primitive-shuffle lst times))))
