(in-package #:ws.ikki.yoi)

;;; function that verifies the user data in the database

(defaction check-login (user password)
  (if (find-user user password)
      (progn
	;; if the data is correct the access to the system is allowed
	(setf $usersession user)
	(call-as-window 'blog-window))
      ;;if the data is incorrect calls the same component "login-post"
      (call 'login-post)))