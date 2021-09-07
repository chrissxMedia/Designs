(load "svg.cl")

;; For some reason no kind of anchor attributes seems to put the text at the
;; correct coordinates, so we have to subtract (3.125,-34.375)
;; Those are the numbers that Inkscape saved when I positioned a <text> at (0,0)
(defun common-text (font x y color text)
  (svg::text text (cons :x (- x 3.125)) (cons :y (+ y 34.375)) (cons :font font) (cons :font-size "50px") (cons :color color)))
(defun unifont (x y color text) (common-text "Unifont" x y color text))
(defun minecraft (x y color text) (common-text "Minecraft" x y color text))
(defun background (color) (svg::rect (cons :w "100%") (cons :h "100%") (cons :color color)))
(defun small-text (font text) (svg::text text (cons :font font)))
(defun normal (y text) (unifont 50 y "#202020" text))
(defun cmcolor (y name color) (format nil "~d~%  ~d" (unifont 200 y color name) (unifont 480 y color (format nil "(~d)" color))))
(defun cmlogo (x color)
  (svg::text "c" (cons :x x) (cons :y 950) (cons :font "Minecraft") (cons :font-size "225px") (cons :color color)))

(with-open-file (stream "cm_style.svg"
                        :direction :output
                        :if-exists :supersede
                        :if-does-not-exist :create)
  (format stream (svg::svg 1000 1000 (background "#ffffff")
                                     (minecraft 50 50 "#202020"
                                                (format nil "~%    chrissx Media ~d~%  " (small-text "Unifont" "Corporate Style 2.2rc3")))
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
                                     (cmlogo 645 "#C02020"))))
