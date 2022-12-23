<?php 

namespace Controllers; 
use MVC\Router; 
use Model\Admin; 

class LoginController {
    public static function login( Router $router ) {

        $errores = []; 

        if($_SERVER['REQUEST_METHOD'] === 'POST') {
            
            $auth = new Admin($_POST); 

            $errores = $auth->validar(); 

            if(empty($errores)) {
                // Verificar si el usuario existe 
                $resultado = $auth->existeUsuario(); 

                if(!$resultado) {
                    $errores = Admin::getErrores(); 
                } else { 
                    // Verificar el password 

                    // Autenticar al usuario 

                }

            }
        }

        $router->render('auth/login', [
            'errores' => $errores 
        ]); 
    }
    public static function logout( Router $router ) {
        echo "desde logout"; 
    }
}

