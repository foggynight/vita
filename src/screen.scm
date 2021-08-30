(declare (unit screen))

(import (chicken condition))
(import (prefix sdl2 "sdl2:"))

(define +screen-width+  +world-width+)
(define +screen-height+ +world-height+)

(define +bg-color+  (sdl2:make-color 0 0 0))
(define +org-color+ (sdl2:make-color 0 255 0))

(sdl2:set-main-ready!)
(sdl2:init! '(video events))

(on-exit sdl2:quit!)
(current-exception-handler
 (let ((original-handler (current-exception-handler)))
   (lambda (exception)
     (sdl2:quit!)
     (original-handler exception))))

(define win)
(define ren)

(define (init-screen!)
  (set! win (sdl2:create-window! "vita" 0 0 +screen-width+ +screen-height+))
  (set! ren (sdl2:create-renderer! win)))

(define (clear-win!)
  (set! (sdl2:render-draw-color ren) +bg-color+)
  (sdl2:render-clear! ren))

(define (draw-orgs! orgs)
  (define (%draw-orgs! orgs)
    (unless (null? orgs)
      (let ((org (car orgs)))
        (sdl2:render-draw-point! ren
                                 (org-x org)
                                 (org-y org)))
      (%draw-orgs! (cdr orgs))))
  (set! (sdl2:render-draw-color ren) +org-color+)
  (%draw-orgs! orgs))

(define (draw-scene! orgs)
  (clear-win!)
  (draw-orgs! orgs)
  (sdl2:render-present! ren))
