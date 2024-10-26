<?php
class Router
{
    protected $routes = [];

    public function addRoute($url, $controllerAction)
    {
        $this->routes[$url] = $controllerAction;
    }

    public function route($url)
    {
        if (array_key_exists($url, $this->routes)) {
            $controllerAction = $this->routes[$url];
            list($controller, $action) = explode('@', $controllerAction);

            require_once('controllers/' . $controller . '.php');

            $controllerInstance = new $controller();
            if (method_exists($controllerInstance, $action)) {
                $controllerInstance->$action();
            } else {
                http_response_code(404);
                include('pages/404.php');
            }
        } else {
            http_response_code(404);
            include('pages/404.php');
        }
    }
}
