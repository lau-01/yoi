
(in-package #:ws.ikki.yoi)

;;;catches the exception if the email is already registered and asks the user to specify what you want to do.

(defaction registration (name email security-question security-answer password)

;;  Indicates the type of error, and if there is not, the user data stored
  (if (equal (type-of (registration-db name email security-question security-answer password )) 'CL-POSTGRES-ERROR:UNIQUE-VIOLATION)
      (call 'registry-window :body (make-instance 'error-message))
      (call 'registry-window :body (make-instance 'register-ok))))