
(in-package #:ws.ikki.yoi)

;;;;entry-point and window component type for the user registry.

(defentry-point "registro.ucw" (:application *blog*
				:class regexp-dispatcher)
		()
  (call 'registry-window))

(defcomponent registry-window (standard-window-component)
  ()
  (:default-initargs
   :title "CMS YOI"
   :icon "static/favicon.png"
   :stylesheet (list "static/css/reset.css" "static/css/registro.css")
   :javascript '((:src "static/dojo/js/parenscript.js"))
   :body (make-instance 'register-component)) 
  (:documentation "The main window component for not logged users."))


;;;component for user registration
(defcomponent register-component ()
  ())

;;;call the function for user registration.
(defmethod render ((component register-component))
  (user-reg-form))

;;; function for user registration
(defun user-reg-form ()    
   "Processes the data to be stored in the database
   In: All user data name, email, security-question, security-answer, password, confirm-password
   Out: if correct data stores, if you do not indicate where this error. "  
  (let
      ((name           nil)
       (email              nil)
       (security-question (get-security-questions))  ;declare the variable security-question  and assign the values obtained by the function get-security-questions
       (security-answer    nil)
       (password           nil)
       (confirm-password   nil))
    
    (<ucw:form :function (constantly t)
	       :method "post"
	       ;calls a javascript function to validate data
	       :onsubmit (list "return" (ps (alta_usuario1 "email"  "squestion" "answer" "password" "confirm-password")))	     
	       
	       (<:div :id "encabezado"
		      (<:p "INFORMACIÓN DEL USUARIO"))
	       (<:br)
       	       (<:br)
	       (<:div :id "texto"
		      (<:label :for "name" :class "label-registration" "Nombre")
		      (<:br)
		      (<:div :id "div-name"
			     (<ucw:input :type "text"
					 :id "name"
					 :placeholder "Nombre(s)"
					 :accessor name 
					 
					 :class "name")
			     (<:br)
			     (<:br)	       
			     (<:div :id "texto"
				    (<:label :for "email" :class "label-registration" "E-mail*"))
			     (<:div :id "inputs"
				    (<ucw:input :type "text"
						:id "email"
						:accessor email
						:onkeypress (list "return" (ps (validate_key_email_keypress event)))
						:onblur (ps (validate_email_onblur "email"))
						:class "input"))
			     (<:br)
			     (<:br)	        
			     (<:div :id "texto"
				    (<:label :for "squestion" :class "label-registration" "Pregunta se seguridad*"))
			     (<:br)
			     (<:div :id "div-squestion"
				    (<ucw:select :id "squestion"
						 :class "squestion"
						 :accessor security-question
						 (<ucw:option :value 0 "Selecciona una pregunta de seguridad")
						 (dolist (item security-question)
						   (<ucw:option :value (car item) (<:as-html (second item))))))
			     (<:br)
			     (<:div :id "div-sanswer"
				    (<ucw:input :type "text"
						:id "answer"
						:accessor security-answer
						:placeholder "Respuesta*"				  
						:class "input"))
			     (<:br)
			     (<:br)
			     (<:div :id "texto"
				    (<:label :for "password" :class "label-registration" "Contraseña*"))
			     (<ucw:input :type "password"
					 :id "password"
					 :accessor password
					 :onblur (ps (valida_alta_password "password"))					
					 :title "La contraseña debe de ser de 8 o más caracteres."
					 :class "input")
			     (<:br)
			     (<:div :id "texto"
				    (<:label :for "confirm-password" :class "label-registration" "Confirmar contraseña*"))
			     (<ucw:input :type "password"
					 :id "confirm-password"
					 :accessor confirm-password
					 :onblur (ps (confirm_password "password" "confirm-password"))
					 :title "La contraseña debe de ser de 8 o más caracteres."
					 :class "input")
			     
			     (<:br)
			     
			     (<:div :id "boton" 		      
				    (<ucw:submit :value "Registrarme" 
						 :class "boton1"
						 :action (registration name email  security-question security-answer  (hash-password (encrypt-password password)))))
			     (<:div :id "texto" "* Campos obligatorios"))))))
	       
	      














