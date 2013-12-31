	//------------------------------------------------------------------->

function valida_alta_password (idpassword)
{
    var password = document.getElementById(idpassword);
    if ( password.value.length > 7) 
    { 
	password.className="input";	
	return true;
    }
    else
    {
	password.className="input-error";
	return false;
    }
}

function confirm_password (pwd,pwd1) 
{
 var status=match_passwords(pwd,pwd1);
 var password = document.getElementById(pwd);
 var password1 = document.getElementById(pwd1);
 if (status == true)
    { 
     password.className="input";
     password1.className="input";
    }
 else
 {
  password.className="input-error";
  password1.className="input-error";
 }
 return status;
}

//------------------------------------------------------------------->

//---------> Funcion alta perfil

    function alta_perfil (idname,idlastname,idmothersname,idemail,idlandline,idmobile_phone,idtwitter,idgoogle_plus,idfacebook)
 {	     
    checar_name = valida_alta_name (idname);
    checar_lastname = valida_alta_lastname (idlastname);
    checar_mothersname = valida_alta_mothersname (idmothersname);
    checar_email = validate_email_onblur (idemail);
    checar_landline = valida_landline_onblur (idlandline);
    checar_mobile_phone = valida_mobile_phone_onblur (idmobile_phone);
    checar_twitter = valida_alta_twitter (idtwitter);
    checar_google_plus = valida_alta_google_plus (idgoogle_plus);
    checar_facebook = valida_alta_facebook (idfacebook);

    if ((checar_name == true) && 
    (checar_lastname == true) && 
    (checar_mothersname == true) &&
    (checar_email == true) &&
    (checar_landline == true) &&
    (checar_mobile_phone == true) &&
    (checar_twitter == true) &&
    (checar_facebook == true) &&  
    (checar_google_plus == true))
    
    {
	
	return true;
    }
    
    else
    
    {

	return false;	
    }
 }

//--------------------------------------------------------------------------->

function valida_alta_name (iditem)

{
    var patter = /^[A-Za-záéíóúÁÉÍÓÚ A-Za-z*]+$/;
    var name = document.getElementById(iditem);
    var evalue = patter.test (name.value);
    name.className="inputs";
    if (evalue == true)
    {
	name.className="inputs";	
    }
    else
    {
	name.className="inputs-error";	
    }
    return evalue;      
}
//-------------------------------------------------------------------------->

//----> Funcion valida alta_lastname

function valida_alta_lastname (iditem)

{
    var patter = /^[A-Za-záéíóúÁÉÍÓÚ A-Za-z*]+$/;
    var lastname = document.getElementById(iditem);
    var evalue = patter.test (lastname.value);
    lastname.className="inputs";
    if (evalue == true)
    {
	lastname.className="inputs";	
    }
    else
    {
	lastname.className="inputs-error";	
    }
    return evalue;      
}
//-------------------------------------------------------------------->

//----> Funcion valida alta_mothersname

function valida_alta_mothersname (iditem)

{
    var patter = /^[A-Za-záéíóúÁÉÍÓÚ A-Za-z*]+$/;
    var mothersname = document.getElementById(iditem);
    var evalue = patter.test (mothersname.value);
    mothersname.className="inputs";
    if (evalue == true)
    {
	mothersname.className="inputs";	
    }
    else
    {
	mothersname.className="inputs-error";	
    }
    return evalue;      
}


//------------------------------------------------------------------->


//------------------> Funcion valida alta_email.

function valida_alta_email (iditem)

{
    var patter = /^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,3})$/;
    var email = document.getElementById(iditem);
    var evalue = patter.test (email.value);
    email.className="inputs";
    if (evalue == true)
    {
	email.className="inputs";	
    }
    else
    {
	email.className="inputs-error";	
    }
    return evalue;      
}


   // patron=/^[A-Za-záéíóúÁÉÍÓÚ A-Za-z*]+$/;
   // var alta_nombre = document.getElementById(iditem);
   // evaluacion = patron.test(alta_nombre.value);
   //  alta_nombre.className="inputs";	




//------------------------------------------------------------------->

//----> Funcion para validar lastname

function valida_alta_lastname(iditem)
{
    patron=/^[A-Za-záéíóúÁÉÍÓÚ A-Za-z*]+$/;
    var alta_nombre = document.getElementById(iditem);
    evaluacion = patron.test(alta_nombre.value);
    alta_nombre.className="inputs";	
    if (evaluacion == true)
    {
	alta_nombre.className="inputs";	
    }
    else
    {
	alta_nombre.className="inputs-error";	
    }
    return evaluacion;      
}

//------------------------------------------------------------------->

// Valida mothersname

function valida_alta_mothersname(iditem)
{
    patron=/^[A-Za-záéíóúÁÉÍÓÚ A-Za-z*]+$/;
    var alta_nombre = document.getElementById(iditem);
    evaluacion = patron.test(alta_nombre.value);
    alta_nombre.className="inputs";	
    if (evaluacion == true)
    {
	alta_nombre.className="inputs";	
    }
    else
    {
	alta_nombre.className="inputs-error";	
    }
    return evaluacion;      
}

//------------------------------------------------------------------->

//---------------> Validar onblur y onkeypress

// funcion para validar usuario en el formulario alta usuario
// Esta funcion se llama en el evento onkeypress

//------------------------------------------------------------------->


function valida_alta_name_presskey (e)
{
    tecla_presionada=(document.all) ? e.keyCode : e.which;
    if (tecla_presionada == 8) return true; // para la tecla de retroceso
    if (e.keyCode == 37) return true; // para la tecla izquierda
    if (e.keyCode == 39) return true; // para la tecla derecha
    if (e.keyCode == 9) return true; // para la tecla tab
    patron=/[A-Za-z A-Za-z*]/;
    ascii_tecla_presionada=String.fromCharCode(tecla_presionada);
    return patron.test(ascii_tecla_presionada);
   
}

//------------------------------------------------------------------->

function alta_usuario1 (idemail,idsquestion,idanswer,idpassword,idconfirmpassword)
{
	// check the mail
   var checar_email = validate_email_onblur (idemail);
   // check the password
	var checar_password = valida_alta_password (idpassword);
	// check the password
   var confirm_password = valida_alta_password (idconfirmpassword);
   // get the reference 
   var squestion = document.getElementById(idsquestion);
   // get the reference
   var answer = document.getElementById(idanswer);
   // get the reference
   var pwd = document.getElementById(idpassword);
   // get the reference
   var pwd1 = document.getElementById(idconfirmpassword);
   // set default value
    var status =true;
  
    // set the class by defualt, this mean that the fields are correct
    answer.className="input";
    pwd.className="input";
    pwd1.className="input";
   // here we valitate all fields
    if ((checar_email == true) && (squestion.selectedIndex != 0) && (answer.value != "") && (checar_password == true)  && (confirm_password ==true) && (pwd.value == pwd1.value))
    {
    	// the form was validate
    	status=true;
    }
    else
    {
    	if ((answer.value == "") || (squestion.selectedIndex == 0))
	     {
    	      answer.className="input-error";
	      }
       if  ((pwd.value != pwd1.value) || (pwd.value.length < 8) || (pwd1.value.length < 8))
            {    
       	      pwd.className="input-error";
	            pwd1.className="input-error";
            }
		
    status =false;
    }
	// finally we return the status
     	return status;
}

//------------------------------------------------------------------->

//---------------> Funcion de alta_username

// funcion para validar usuario en el formulario alta usuario
// Esta funcion valida que inicie con letras
// Esta funcion se llama en el evento onblur

function valida_alta_username(iditem)
{
    patron=/^[A-Za-záéíóúÁÉÍÓÚ0-9 _ \- \. A-Za-záéíóúÁÉÍÓÚ0-9 _ \- \. ]+$/;
    var alta_nombre = document.getElementById(iditem);
    evaluacion = patron.test(alta_nombre.value);
    alta_nombre.className="input-registration";	
    if (evaluacion == true)
    {
	alta_nombre.className="input";	
    }
    else
    {
	alta_nombre.className="input-error";	
    }
    return evaluacion;      
}

//------------------------------------------------------------------->

// funcion para validar usuario en el formulario alta usuario
// Esta funcion se llama en el evento onkeypress

function valida_alta_username_presskey (e)
{
    tecla_presionada=(document.all) ? e.keyCode : e.which;
    if (tecla_presionada == 8) return true; // para la tecla de retroceso
    if (e.keyCode == 37) return true; // para la tecla izquierda
    if (e.keyCode == 39) return true; // para la tecla derecha
    if (e.keyCode == 9) return true; // para la tecla tab
    patron=/[A-Za-z A-Za-z*]/;
    ascii_tecla_presionada=String.fromCharCode(tecla_presionada);
    return patron.test(ascii_tecla_presionada);
   
}


//------------------------------------------------------------------->

// funcion para validar apellido paterno en el formulario alta usuario
// Esta funcion se llama en el evento onblur

function valida_alta_apeterno (iditem)
{
    patron=/^[A-Za-zÑñáéíóúÁÉÍÓÚ a-zA-ZñÑ]+$/;
    var alta_apaterno=document.getElementById(iditem);
    evaluacion=patron.test(alta_apaterno.value);
    alta_apaterno.className="input-registration";	
    if (evaluacion == true)
    {
	alta_apaterno.className="input-registration";	
    }
    else
    {
	alta_apaterno.className="input-registration-error";	
    }
    return evaluacion;      
}

//------------------------------------------------------------------->

// funcion para validar apellido paterno en el formulario alta usuario
// Esta funcion se llama en el evento onblur

function valida_alta_apeterno_keypress (e)
{
    tecla_presionada = (document.all) ? e.keyCode : e.which;
    if (tecla_presionada == 8) return true;  
    if (e.keyCode == 37) return true; // para la tecla izquierda
    if (e.keyCode == 39) return true; // para la tecla derecha
    if (e.keyCode == 9) return true; // para la tecla tab
    patron=/^[A-ZÑa-zñáéíóúÁÉÍÓÚ A-ZÑa-zñáéíóúÁÉÍÓÚ]+$/;
    
    ascii_tecla_presionada=String.fromCharCode(tecla_presionada);
	
    return patron.test(ascii_tecla_presionada);
}


//------------------------------------------------------------------->

// funcion para validar apellido materno en el formulario alta usuario
// Esta funcion se llama en el evento onblur

function valida_alta_amaterno (iditem)
{
    patron=/^[A-Za-zÑñáéíóúÁÉÍÓÚ a-zA-ZñÑáéíóúÁÉÍÓÚ]+$/;
    var alta_amaterno=document.getElementById(iditem);
    evaluacion=patron.test(alta_amaterno.value);
    alta_amaterno.className="input-registration";	
    if (evaluacion == true)
    {
	alta_amaterno.className="input-registration";	
    }
    else
    {
	alta_amaterno.className="input-registration-error";	
    }
    return evaluacion;      
}

//------------------------------------------------------------------->

// funcion para validar apellido paterno en el formulario alta usuario
// Esta funcion se llama en el evento onblur
function valida_alta_amaterno_keypress (e)
{
    tecla_presionada = (document.all) ? e.keyCode : e.which;
    if (tecla_presionada == 8) return true;  
    if (e.keyCode == 37) return true; // para la tecla izquierda
    if (e.keyCode == 39) return true; // para la tecla derecha
    if (e.keyCode == 9) return true; // para la tecla tab
    
    patron=/^[A-ZÑa-zñ A-ZÑa-zñ]+$/;
    
    ascii_tecla_presionada=String.fromCharCode(tecla_presionada);
	
    return patron.test(ascii_tecla_presionada);
}


//------------------------------------------------------------------->


function alta_usuario2 (nombre ,apaterno, amaterno)
{
    var evaluacion = false;

    checar_nombre = valida_alta_username (nombre);
    checar_apaterno=valida_alta_apeterno(apaterno);
    checar_amaterno=valida_alta_amaterno(amaterno);

    if ((checar_nombre == true) && (checar_apaterno==true) && (checar_amaterno==true))
    {
	evaluacion = true;
    }

    return evaluacion;
}


//------------------------------------------------------------------->

function match_passwords (pwd,pwd1)
{
    var pass=document.getElementById(pwd);
    var pass1=document.getElementById(pwd1);
    var edo=false;
    if (pass.value == pass1.value && !(pass.value== "") && !(pass1.value== ""))
    {
	edo=true;
    }        

    return edo;
}

//------------------------------------------------------------------->


function validate_key_number_keypress (e)
{  
    var key_pressed;
    var pattern;
    var  ascii_key_pressed;

    key_pressed = (document.all) ? e.keyCode : e.which;
    if (key_pressed == 8) return true;  // back space
    if (e.keyCode == 37) return true; //  left
    if (e.keyCode == 39) return true; // right
    if (e.keyCode == 9) return true; //  tab

    pattern=/[0-9]/; 
    
    ascii_key_pressed=String.fromCharCode(key_pressed);
	
    return pattern.test(ascii_key_pressed);
}

//------------------------------------------------------------------->


function validate_zip_code_onblur (iditem)
{
    var pattern=/^0$|^[0-9]{5}$/;
    var zip = document.getElementById(iditem);
    var eval = pattern.test(zip.value);
    zip.className="inputs";
    if (eval == true)
    {
	zip.className="inputs";
    }
    else
    {
	zip.className="inputs-error";
    }
    return eval;
}

//------------------------------------------------------------------->

//-----> Funcion email_onblur

function validate_email_onblur (iditem)
{
    var pattern= /^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,3})$/;
    var email = document.getElementById(iditem);
    var eval = pattern.test(email.value);
    email.className="inputs";
    if (eval == true)
    {
	email.className="inputs";
    }
    else
    {
	email.className="inputs-error";
    }
    return eval;
}

//------------------------------------------------------------------->

//----->Funcion para twitter

function valida_alta_twitter (iditem)
{
    var pattern= /^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,3})$|^$/;
    var twitter = document.getElementById(iditem);
    var eval = pattern.test(twitter.value);
    twitter.className="inputs";
    if (eval == true)
    
    {
	twitter.className="inputs";
    }
    
    else
    
    {
	twitter.className="inputs-error";
	//alert ("Valor de la expresion es:" + eval);
    	return false;
    
    }
    return eval;
}



//------------------------------------------------------------------->

//------> Funcion para google_plus
    function valida_alta_google_plus (iditem)
{
    var pattern= /^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,3})$|^$/;
    var google_plus = document.getElementById(iditem);
    var eval = pattern.test(google_plus.value);
    google_plus.className="inputs";
    if (eval == true)
    
    {
	google_plus.className="inputs";
    }
    
    else
    
    {
	google_plus.className="inputs-error";
    	return false;
	
    }
    return eval;
}


//------------------------------------------------------------------->

//----->Funcion para facebook

function valida_alta_facebook (iditem)
{
    var pattern= /^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,3})$|^$/;
    var facebook = document.getElementById(iditem);
    var eval = pattern.test(facebook.value);
    facebook.className="inputs";
    if (eval == true)
    
    {
	facebook.className="inputs";
    }
    
    else
    
    {
	facebook.className="inputs-error";
	return false;    

    }
    return eval;
}


//------------------------------------------------------------------->

//Funcion alphareg.


function validate_email_onblur (iditem)
{
    var pattern= /^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,3})$/;
    var email = document.getElementById(iditem);
    var eval = pattern.test(email.value);
    email.className="input";
    if (eval == true)
    {
	email.className="input";
    }
    else
    {
	email.className="input-error";
    }
    return eval;
}

//------------------------------------------------------------------->

//----> Funcion timezones
function  get_time_zone(iditem)

{
    var d = new Date();
    var tz = document.getElementById(iditem);
    /*
      The time-zone offset is the difference, in minutes, between UTC and local time. Note that this means that the offset is positive if the
      local timezone is behind UTC and negative if it is ahead.
      */
    var minutesTimeZone= d.getTimezoneOffset();

    //  we multiply by -1 to match standard  time zone
    // and multiply by 60 to get seconds  (-1 * 60 = -60)
    
    var  timezone = minutesTimeZone  * -60;
    // Here we get the offset in seconds
    
    tz.value = timezone;
}


function valida_key_email_keypress (e)
{
    key_pressed = (document.all) ? e.keyCode : e.which;
    if (key_pressed == 8) return true;  // back space
    if (e.keyCode == 35) return true; // end
    if (e.keyCode == 36) return true; //start
    if (e.keyCode == 37) return true; //left
    if (e.keyCode == 39) return true; // right
    if (e.keyCode == 9) return true; // tab

    pattern=/[A-Za-zñ._Ñ0-9@-]/;
    ascii_key_pressed=String.fromCharCode(key_pressed);
    return pattern.test(ascii_key_pressed);
}

//------------------------------------------------------------------->

//----> Funcion telefono


function valida_landline_onblur (iditem)
{
    var patron=/^0$|^[0-9]{10}$|^$/;
    var landline = document.getElementById(iditem); // se obtiene la refencia del elemento
    var evaluacion = patron.test(landline.value); // se aplica la expresion regular retorna un true si es valida
    landline.className="inputs";	
    if (evaluacion == true)
    {
	landline.className="inputs";	
    }
    else
    {
	landline.className="inputs-error";
	return false;	
    }
    return evaluacion;      
}

function valida_landline_keypress (e)
{
    return valida_numeros (e);
}


//------------------------------------------------------------------->

//----> Funcion celular



function valida_mobile_phone_onblur (iditem)
{
    var patron=/^0$|^[0-9]{10}$|^$/;
    var mobile_phone = document.getElementById(iditem); // se obtiene la refencia del elemento
    var evaluacion = patron.test(mobile_phone.value); // se aplica la expresion regular retorna un true si es valida
    mobile_phone.className="inputs";	
    if (evaluacion == true)
    {
	mobile_phone.className="inputs";	
    }
    else
    {
	mobile_phone.className="inputs-error";
	return false;	
    }
    return evaluacion;      
}

function valida_mobile_phone_keypress (e)
{
    return valida_numeros (e);
}

function valida_numeros (e)
{  
    var tecla_presionada;
    var patron;
    var  ascii_tecla_presionada;

    tecla_presionada = (document.all) ? e.keyCode : e.which;
    if (tecla_presionada == 8) return true;  // para la tecla de retroceso o back space
    if (e.keyCode == 37) return true; // para la tecla izquierda
    if (e.keyCode == 39) return true; // para la tecla derecha
    if (e.keyCode == 9) return true; // para la tecla tab

    patron=/[0-9]/; // expresion regular que acepta letras espacio y punto
    
    ascii_tecla_presionada=String.fromCharCode(tecla_presionada);
	
    return patron.test(ascii_tecla_presionada);
}