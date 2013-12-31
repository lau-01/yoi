(in-package #:ws.ikki.yoi)

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
				 :action (call-as-window 'login-window)))
	     (<:div :id "boton2"
		    (<ucw:submit :value "Iniciar sesion" 
				 :class "boton2"
				 :action (call-as-window 'login-window)))))