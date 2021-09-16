(defpackage :svg (:use :cl))
(in-package svg)

(defun attr (key value)
  (format nil "~d=\"~d\""
          (cdar (remove-if-not (lambda (x) (equal (car x) key))
                              '((:x . "x") (:y . "y") (:font . "font-family") (:font-size . "font-size")
                                           (:w . "width") (:h . "height") (:d . "d") (:color . "fill")
                                           (:font-weight . "font-weight") (:text-align . "text-align")
                                           (:text-anchor . "text-anchor") (:id . "id") (:style . "style")
                                           (:stroke . "stroke") (:stroke-width . "stroke-width"))))
          value))
(defun attrs (as) (format nil " ~d" (reduce (lambda (x y) (format nil "~d ~d" x y))
                                            (map 'list (lambda (x) (attr (car x) (cdr x))) as))))
;                                               TODO: change this to allow for no attrs
(defun -long-el (tag inner &rest as) (format nil "<~d~d>~d</~d>" tag (attrs as) inner tag))
(defun -os-el (tag &rest as) (format nil "<~d~d />" tag (attrs as)))

; TODO: figure out a way to do this nicely
(defun text (&rest args) (apply #'-long-el (cons "text" args)))
(defun rect (&rest args) (apply #'-os-el (cons "rect" args)))
(defun path (d &rest args) (apply #'-os-el (cons "path" (cons (cons :d d) args))))

(defun svg (width height &rest children)
  (format nil "<?xml version=\"1.0\" encoding=\"UTF-8\"?>~%<svg width=\"~dmm\" height=\"~dmm\" viewBox=\"0 0 ~d ~d\">~%  ~d~%</svg>~%"
          width height width height (reduce (lambda (x y) (format nil "~d~%  ~d" x y)) children)))

(defun write (path &rest args)
  (with-open-file (stream path :direction :output
                               :if-exists :supersede
                               :if-does-not-exist :create)
    (format stream (apply svg args))))
