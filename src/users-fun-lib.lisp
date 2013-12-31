(in-package #:ws.ikki.yoi)

;;;;function that performs the insertion into the database, if the email does not exist, and if already registered, prevents exepcion.

 (defun registration-db (name email security-question security-answer password)
  (let ((consulta))
    
    (handler-case 
	(setf consulta (with-database (query (:insert-into 'users 
					  :set  'name name 
					  'email email
					  'security_question security-question 
					  'answer security-answer
					  'password password))))
     ;catches the exepcion
      (error  (condition) 
	(values condition)))))


;;;

 (defun get-user-id (name)
   "You can call this function for get the user id of the current user, gathered from UCW session object for current user. Works on dB (Model) Level.
    IN: Nothing explicit.
    OUT: id_user from current user."
   (let ((id-user))
     (with-database
       (doquery (:select 'id_user :from 'users :where (:= 'name name))
	   ;; define local vars
	   (qid-user)
	 (setf id-user qid-user))) id-user))

(defun get-user-name (id-user)
  (let ((name)) 
    (setf name (with-database (query (:select 'name :from 'users :where (:= 'id_user id-user)))))
    (car name)))

 


 