(declare (unit organism))

(define +world-width+  640)
(define +world-height+ 480)

;; Record type representing an organism with an x-y position.
(define-record-type org
  (make-org x y)
  org?
  (x org-x (setter org-x))
  (y org-y (setter org-y)))

(define (move-org org x y)
  (let ((new-x (+ (org-x org) x))
        (new-y (+ (org-y org) y)))
    (unless (or (< new-x 0)
                (>= new-x +world-width+))
      (set! (org-x org) new-x))
    (unless (or (< new-y 0)
                (>= new-y +world-height+))
      (set! (org-y org) new-y))))

(define (update-org org)
  (move-org org 1 1))

(define (update-orgs orgs)
  (unless (null? orgs)
    (update-org (car orgs))
    (update-orgs (cdr orgs))))
