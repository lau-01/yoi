
(in-package #:ws.ikki.yoi)

;;;delete session variables
(defaction logout ()
  (foo)
  (call-as-window 'blog-window :stylesheet *style*)) ; simply throw away all the components


(defun foo ()
  (setf (get-session-value :usersession) nil)
  (ucw-core:with-lock-held-on-application (context.application *context*)
    (delete-session (context.application *context*)
		    (context.session *context*))))