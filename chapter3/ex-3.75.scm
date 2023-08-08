(define (make-zero-crossings input-stream last-value last-average-value)
  (let ((avpt (/ (+ (stream-car input-stream) last-value) 2)))
    (cons-stream
      (sign-change-detector avpt last-average-value)
      (make-zero-crossings
        (stream-cdr input-stream) (stream-car input-stream) avpt))))
