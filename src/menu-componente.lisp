
(in-package #:ws.ikki.yoi)


;;; Definicion del componente para el menu del blog

(defcomponent menus-component ()())

;;; Con este metodo se hace visible el componente en el navegador.

(defmethod render ((self menus-component))  
  (<:div :id "leftcolumnwrap"
	 (<:div :id "leftcolumn"
		(<:h1
		 (<:as-html (format nil "Menu" ))) 
		;; Se crea un formulario que contendra los botones del menu y las ligas de interes.
		(<ucw:form :function (constantly t)		    
			   (<:img :src "/static/post1.png" :width 100 :height 120)
			   (<:div :id "menu"
				  (<:ul :id "menu"
					(<:li :class "limenu" 
					      (<ucw:a :class "amenu"
						      :action (call-component $contenido (make-instance 'show-all-abstract)) "Home"))
					
					(db-connection)
					
					(doquery (:select 'topic_id
							  'topic_name
							  :from 'topics)
					    (topic-id topic-name)
					  (<:li :class "limenu" 
						(<ucw:a :class "amenu"
							:action
							(call-component
							 $contenido 
							 (make-instance
							  'show-by-topic :topic-id topic-id)) (<:as-html topic-name ) )))
					(db-disconnection)
					
;;;;;;;;;;;;;
					(if (loggen-in)
					    (progn 
					      (<:h1(<:as-html (format nil "Admin" )))
					      (<:li :class "limenu" 
						    (<ucw:a :class "amenu"
							    :action (call-component $contenido (make-instance 'add-post)) "Add Post"))
					      (<:li :class "limenu" 
						    (<ucw:a :class "amenu"
							    :action (call-component $contenido (make-instance 'search-post-component)) "Edit post"))
					      
					      (<:li :class "limenu" 
						    (<ucw:a :class "amenu"
							    :action (call-component $contenido (make-instance 'add-topic)) "Add topic"))
					      (<:li :class "limenu" 
						    (<ucw:a :class "amenu"
							    :action ( call-component $contenido
										     (make-instance 'search-delete)) "Delete Post"))
					      (<:li :class "limenu" 
						    (<ucw:a :class "amenu"
							    :action (logout) "Logout"))
					      
					      (<:li :class "limenu" 
						    (<ucw:a :class "amenu"
							    :action (set-layout-and-stylesheet) "Stylesheet"))
					      
					      
					      ))))
			   (<:br)
			   (<:br)
			   (<:as-html (format nil "Login as: ~A" $usersession))
			   (<:br)(<:br)
			   (<:h3
			    (<:as-html (format nil "Links"  )))
			   (<:a :href "http://www.Debian.org" :target "_blank"
				(<:img :src "/static/debian2.jpg" :width 180 :height 100))
			   (<:br)
			   (<:a :href "http://common-lisp.net/" :target "_blank"
				(<:img :src "/static/logol.jpg" :width 160 :height 140))
			   (<:br)(<:br)
			   (<:img :src "/static/logol1.jpg" :width 190 :height 200)))))

#|
Se define el componente "menu-component" que se le aplica un estilo y de crean los menus que contendra el blog.
Se han creado 3 botones.
>>  El primer botón tiene la funcionalidad de mostrar los últimos 5 posts creando una instancia de show-all-abstract.
>>  El segundo botón  tiene la funcionalidad de agregar un post.
>>  El tercer boton tiene la funcionalidad de editar un post, que primero se búsca el posta a editar.
|#