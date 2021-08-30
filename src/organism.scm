(declare (unit organism))

;; Record type representing an organism with an x-y position.
(define-record-type org
  (make-org x y)
  org?
  (x org-x (setter org-x))
  (y org-y (setter org-y)))
