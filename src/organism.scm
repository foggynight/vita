(declare (unit organism))

(import (srfi 27))

(define +world-width+  640)
(define +world-height+ 480)

(define +move-cost+ 1)

;; Record type representing an organism with an x-y position.
(define-record org
  (setter x)
  (setter y)
  (setter energy))

(define (move-org! org x y)
  (let ((new-x (+ (org-x org) x))
        (new-y (+ (org-y org) y)))
    (unless (or (< new-x 0)
                (>= new-x +world-width+))
      (set! (org-x org) new-x))
    (unless (or (< new-y 0)
                (>= new-y +world-height+))
      (set! (org-y org) new-y))))

(define (update-org! org)
  (when (>= (org-energy org) +move-cost+)
    (move-org! org
               (random-integer 2)
               (random-integer 2))
    (set! (org-energy org) (- (org-energy org) 1))))

(define (update-orgs! orgs)
  (unless (null? orgs)
    (update-org! (car orgs))
    (update-orgs! (cdr orgs))))
