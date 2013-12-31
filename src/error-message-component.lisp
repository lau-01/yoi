(in-package #:ws.ikki.yoi)


(defcomponent error-message ()
  ())

(defmethod render ((self error-message))
  (<ucw:form :function (constantly t)
	     (<:p 
	      (<:img :src "static/img/warning.png" :width 50 :height 50) 
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