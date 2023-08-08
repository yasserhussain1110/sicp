(load "ex-2.40.scm")
(load "enumerate-interval")
(load "flatmap")
(define (distinct-triplets n)
  (flatmap (lambda (x)
	     (map (lambda (y)
		    (append y (list x)))
		  (unique-pairs (- x 1)))) (enumerate-interval 1 n)))

(define (sum-distinct-triplets n s)
  (filter (lambda (x)
	    (= s (+ (car x) (cadr x) (caddr x))))
	  (distinct-triplets n)))
