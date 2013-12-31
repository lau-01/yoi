(in-package #:ws.ikki.yoi)

;;;; access to the system


;;;component type window with which users will have access to the system
(defcomponent login-window (standard-window-component )
  ()
  (:default-initargs 
   :title "Login"
   :icon "static/favicon.png"
   :stylesheet '("static/css/reset.css" "static/css/loginwindow.css")
   :javascript 
   '((:src  "static/dojo/js/parenscript.js"))
   :body (make-instance 'login-post)))



(defentry-point "login.ucw" (:application *blog*
			     :class regexp-dispatcher)
		()
  (call-as-window 'login-window ))


;;;component in which the user placed their name and password to access the system
(defcomponent login-post () 
  ())

(defmethod render ((l login-post))
  (let
      ((user nil)
       (pwd nil))
    (<:div :id "wrapper" 
	   (<:div :id "body3"
		  (<:div :id "login-wrapper"
			 (<:div :id "login1"
				(<:div :id "login1-texto" "Iniciar sesión"))
			 (<:div :id "login2"
				(<ucw:form 
				 :function (constantly t)
				 :method "post" 
				 
				 (<:div :id "login2-texto" "Usuario")
				 (<:div :id "wrap-inputlogin"
					(<ucw:input :type "text"
						    :accessor user
						    :class "inputlogin"))
				 (<:div :id "login2-texto"  "Contraseña")				      
				 (<:div :id "wrap-inputlogin"
					(<ucw:input :type
						    "password" 
						    :accessor pwd
						    :class "inputlogin"))
				 (<:div :id "wrap-botton"
					(<ucw:submit :value "Iniciar sesión" 
						     :class "blogin"
						     ;a hashing and encryption to the password entered by the user to match the one stored in the database is applied.
						     :action (check-login user (hash-password (encrypt-password pwd))))))))))))