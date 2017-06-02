#|
Refer to clojure documentation for usage

TODO check if these two could be merged into one higher order macro.

Hugo Hörnquist -- 2017-06-02
|#

(define-module (macros doto)
  #:export (-> ->>))

(define-syntax ->
  (syntax-rules ()
    ((-> obj)
     obj)
    ((-> obj (func args ...) rest ...)
     (-> (func obj args ...) rest ...))
    ((-> obj func rest ...)
     (-> (func obj) rest ...))))

(define-syntax ->>
  (syntax-rules ()
    ((->> obj)
     obj)
    ((->> obj (func args ...) rest ...)
     (->> (func args ... obj) rest ...))
    ((->> obj func rest ...)
     (->> (func obj) rest ...))))
