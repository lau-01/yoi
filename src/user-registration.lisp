
(in-package #:ws.ikki.yoi)

;;;;entry-poin y componente tipo ventana para el regustro de usuarios

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
   :javascript 
   '((:src  "static/dojo/js/parenscript.js"))
   :body (make-instance 'register-component)) 
  (:documentation "The main window component for not logged users."))

(defcomponent register-component ()
  ())

(defmethod render ((component register-component))
  (user-reg-form))

(defun user-reg-form ()    
  (let
      ((name           nil)
       (email              nil)
       
       (security-question (get-security-questions))
       (security-answer    nil)
       (password           nil)
       (confirm-password   nil))
    
    (<ucw:form :function (constantly t)
	       :method "post"
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
				    (<ucw:input :type "email"
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
						 :action (registration1 name email  security-question security-answer  (hash-password (encrypt-password password)))))
			     (<:div :id "texto" "* Campos obligatorios"))))))
	       
	       

(defun get-security-questions ()
  (let ((consulta))
    "vamos a obtener las preguntas de seguridad almacenadas en la base de datos"
     (setf consulta (with-database (query (:select '* :from 'security_question))))))


(defun registration (name email security-question security-answer password)
  (let ((consulta))
    
    (handler-case 
	(setf consulta (with-database (query (:insert-into 'users 
					  :set  'name name 
					  'email email
					  'security_question security-question 
					  'answer security-answer
					  'password password))))
      (error  (condition) 
	(values condition)))))

(defaction registration1 (name email security-question security-answer password)
  
  (if (equal (type-of (registration name email security-question security-answer password )) 'CL-POSTGRES-ERROR:UNIQUE-VIOLATION)
      (call 'registry-window :body (make-instance 'error-message))
      (call 'registry-window :body (make-instance 'register-ok))))




;------------
(defcomponent yes ()
  ())

(defmethod render ((self yes))
  (<:p "hola")
  )
;-----------

(defcomponent error-message ()
  ())

(defmethod render ((self error-message))
  (<ucw:form :function (constantly t)
	     (<:p 
	      (<:img :src "wwwroot/img/warning.png" :width 50 :height 50) 
	      (<:div :id "encabezado2"
		     (<:h1 "El usuario ya existe"))
	      (<:div :id "encabezado3"
		     (<:h1 "¿Qué deseas hacer?"))
	      (<:br) 
	      (<:div :id "boton"	     
		     (<ucw:submit :class "boton1" :value "Iniciar sesion"  		
			   :action  (call-as-window 'login-window )))
	      (<:div :id "boton2"
		     (<ucw:submit :class "boton2" :value "Registrar otro"  		
				  :action (call-as-window 'registry-window :content-component (make-instance 'register-component)))))))



(defcomponent register-ok ()
  ())

(defmethod render ((component register-ok))
  (<:br)
  (<:ah $usersession)
  (<:br)
  (<:div :id "encabezado2"
	 (<:h1 "REGISTRO CONCLUIDO"))
  (<:div :id "texto2"
	 (<:p "Ahora estás registrado, te sugerimos guardar tu nombre de usuario y contraseña."))
  (<:div :id "encabezado3"
	 (<:h1 "¿Qué deseas hacer ahora?"))
  (<ucw:form :function (constantly t) :method "post" 
	     (<:div :id "boton"
		    (<ucw:submit :value "Pagina principal" 
				 :class "boton1"
				 :action (call-as-window 'login-post)))
	     (<:div :id "boton2"
		    (<ucw:submit :value "Iniciar sesion" 
				 :class "boton2"
				 :action (login-post)))))






