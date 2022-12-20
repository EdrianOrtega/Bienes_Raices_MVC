<?php 

namespace Controllers; 

use MVC\Router;
use Model\Propiedad; 
use PHPMailer\PHPMailer\PHPMailer;

class PaginasController {
    public static function index( Router $router) {

        $propiedades = Propiedad::get(3); 
        $inicio = true; 

        $router->render('paginas/index', [
            'propiedades' => $propiedades, 
            'inicio' => $inicio 
        ]); 
    }

    public static function nosotros( Router $router) {
        $router->render('paginas/nosotros'); 
    }

    public static function propiedades( Router $router) {

        $propiedades = Propiedad::all(); 

        $router->render('paginas/propiedades', [
            'propiedades' => $propiedades 
        ]); 
    }

    public static function propiedad( Router $router) {

        $id = validarORedireccionar('/propiedades'); 

        // buscar la propiedad por su id 
        $propiedad = Propiedad::find($id); 

        $router->render('paginas/propiedad', [
            'propiedad' => $propiedad 
        ]); 
    }

    public static function blog( Router $router) {
        
        $router->render('paginas/blog'); 
    }

    public static function entrada( Router $router) {
        
        $router->render('paginas/entrada'); 
    }

    public static function contacto( Router $router) {

        if($_SERVER['REQUEST_METHOD'] === 'POST') { 

            $respuestas = $_POST['contacto']; 

            // Crear una instancia de PHPMailer 
            $mail = new PHPMailer(); 

            // Configurar SMTP (envío de emails)
            $mail->isSMTP(); // metodo para  el envío de correos 
            $mail->Host = 'smtp.mailtrap.io'; 
            $mail->SMTPAuth = true; 
            $mail->Username = '64aee0543d6f0c'; 
            $mail->Password = '311dfbbb1b9c1a'; 
            $mail->SMTPSecure = 'tls'; // tls (Transport Layer Security, seguridad de la capa de transporte)
            $mail->Port = 2525; 

            // Configurar el contenido del email
            $mail->setFrom('admin@bienesraices.com'); 
            $mail->addAddress('admin@bienesraices.com', 'BienesRaices.com'); 
            $mail->Subject = 'Tienes un Nuevo Mensaje'; 

            // Habilitar HTML 
            $mail->isHTML(true); 
            $mail->CharSet = 'UTF-8'; 

            // Definir el contenido 
            $contenido = '<html>'; 
            $contenido .= '<p> Tienes un nuevo mensaje </p>'; 
            $contenido .= '<p> Nombre: ' . $respuestas['nombre'] . ' </p>'; 
            $contenido .= '<p> Email: ' . $respuestas['email'] . ' </p>'; 
            $contenido .= '<p> Teléfono: ' . $respuestas['telefono'] . ' </p>'; 
            $contenido .= '<p> Mensaje: ' . $respuestas['mensaje'] . ' </p>'; 
            $contenido .= '<p> Vende o Compra: ' . $respuestas['tipo'] . ' </p>'; 
            $contenido .= '<p> Precio o Presupuesto: $' . $respuestas['precio'] . ' </p>'; 
            $contenido .= '<p> Prefiere ser contactado por: ' . $respuestas['contacto'] . ' </p>'; 
            $contenido .= '<p> Fecha de Contacto: ' . $respuestas['fecha'] . ' </p>'; 
            $contenido .= '<p> Hora: ' . $respuestas['hora'] . ' </p>'; 
            $contenido .= '</html>'; 
            // .= toma en cuenta el valor anterior y continúa 

            $mail->Body = $contenido; 
            $mail->AltBody = 'Esto es texto alternativo sin HTML'; // este texto es  en caso de que no se soporte el de HTML 

            // Enviar el email 
            if( $mail->send() ) {
                echo "Mensaje enviado Correctamente"; 
            } else {
                echo "El mensaje no se pudo enviar..."; 
            }

        }

        $router->render('paginas/contacto', [
            
        ]); 
    } 
}

?> 