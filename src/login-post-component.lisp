(in-package #:ws.ikki.yoi)


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
						     :action (check-login user (hash-password (encrypt-password pwd))))))))))))