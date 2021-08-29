(import (prefix sdl2 "sdl2:"))

(sdl2:set-main-ready!)
(sdl2:init! '(video))

(on-exit sdl2:quit!)

(define (main)
  (define window (sdl2:create-window! "vita" 0 0 640 480))
  (sdl2:fill-rect! (sdl2:window-surface window)
                   #f
                   (sdl2:make-color 0 0 0))
  (sdl2:update-window-surface! window)
  (sdl2:delay! 2000)
  (sdl2:quit!))
