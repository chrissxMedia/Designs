(defun svg-text (x y font size color text)
  (format nil "<text x=\"~d\" y=\"~d\" font-family=\"~d\" font-size=\"~d\" fill=\"~d\">~d</text>~%" x y font size color text))
(defun svg-rect (width height color)
  (format nil "<rect width=\"~d\" height=\"~d\" fill=\"~d\" />~%" width height color))

(defmacro svg (width height children)
  (format nil "<?xml version=\"1.0\" encoding=\"UTF-8\"?>~%<svg width=\"~dmm\" height=\"~dmm\" viewBox=\"0 0 ~d ~d\">~%~d</svg>~%" width height width height (reduce (lambda (x y) (concatenate 'string x y)) (map 'list (lambda (x) (eval x)) children))))

;; I do not get the reason for the offsets of (-3.125, +34.375) at all, but just
;; reversing them works fine, so let's do that.
(defun unifont (x y color text)
  (svg-text (- x 3.125) (+ y 34.375) "Unifont" "50px" color text))
(defun minecraft (x y color text)
  (svg-text (- x 3.125) (+ y 34.375) "Minecraft" "50px" color text))
(defun background (color)
  (svg-rect "100%" "100%" color))
(defun small-text (font text) (format nil "<text font-family=\"~d\">~d</text>" font text))
(defun normal (y text) (unifont 50 y "#202020" text))
(defun cmcolor (y name color) (format nil "~d~d" (unifont 200 y color name) (unifont 480 y color (format nil "(~d)" color))))
(defun cmlogo (x color) (svg-text x 950 "Minecraft" "225px" color "c"))

(with-open-file (stream "cm_style.svg"
                        :direction :output
                        :if-exists :supersede
                        :if-does-not-exist :create)
  (format stream (svg 1000 1000 ((background "#ffffff")
                                 (minecraft 50 50 "#202020" (format nil "chrissx Media~%~d~%" (small-text "Unifont" "Corporate Style 2.2rc1")))
                                 (normal 150 "Fonts:")
                                 (unifont 200 200 "#202020" "GNU Unifont")
                                 (minecraft 200 250 "#202020" "Minecraft")
                                 (normal 350 "Official Colors:")
                                 (cmcolor 400 "CMRed" "#C02020")
                                 (cmcolor 450 "CMPurple" "#8020F0")
                                 (cmcolor 500 "CMBlack" "#202020")
                                 (cmcolor 550 "PitchBlack" "#000000")
                                 (normal 650 "Inofficial Colors:")
                                 (cmcolor 700 "TransBlue" "#60D0FF")
                                 (cmcolor 750 "TransPink" "#FFB0C0")
                                 (cmlogo 245 "#202020")
                                 (cmlogo 445 "#8020F0")
                                 (cmlogo 645 "#C02020")))))
