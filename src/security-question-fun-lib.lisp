(in-package #:ws.ikki.yoi)

(defun get-security-questions ()
  "let's get the security questions stored in the database" 
  (let ((consulta))
    (setf consulta (with-database (query (:select '* :from 'security_question))))))