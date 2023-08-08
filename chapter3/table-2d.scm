(define (lookup key-1 key-2 table)
  (let ((subtable (assoc key-1 (cdr table))))
    (if subtable
        (let ((record (assoc key-2 (cdr subtable))))
          (if record
              (cdr record)
              #f))
        #f)))

(define (insert! key-1 key-2 value table)
  (let ((subtable (assoc key-1 (cdr table))))
    (if subtable
        (let ((record (assoc key-2 (cdr subtable))))
          (if record
              (set-cdr! record value)
              (set-cdr! subtable (cons (cons key-2 value) (cdr subtable)))))
        (set-cdr! table
                  (cons
                   (list key-1 (cons key-2 value))
                   (cdr table))))))

(define table (cons '*table* '()))

(insert! 'math '+ "add" table)
(insert! 'math '- "sub" table)
(insert! 'math '- "new-sub" table)
table

(lookup 'math '+ table)
(lookup 'math '- table)
