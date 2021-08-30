(declare (uses organism))
(declare (uses screen))

(import (srfi 27))
(import miscmacros)
(import (prefix sdl2 "sdl2:"))

(define target-fps 60)
(define delay-ms (round (/ 1000 target-fps)))

(define (make-random-orgs count)
  (if (zero? count)
      '()
      (cons (make-org (random-integer 640)
                      (random-integer 480))
            (make-random-orgs (- count 1)))))
(define orgs (make-random-orgs 10))

(init-screen!)
(let ((done #f)
      (event #f))
  (while (not done)
    (sdl2:pump-events!)
    (while (sdl2:has-events?)
      (set! event (sdl2:poll-event! event))
      (case (sdl2:event-type event)

        ((window)
         (draw-scene! orgs))

        ((quit)
         (set! done #t))

        ))
    (update-orgs orgs)
    (draw-scene! orgs)
    (sdl2:delay! delay-ms)))
