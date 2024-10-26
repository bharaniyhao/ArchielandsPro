<?php
$crypt = new cryptCls();

$actorcode = $session->get("userid");
$actorname = $session->get("loginuserfulname");

$startdate = date("Y-m-d");
// $upload = new importClass();


switch ($viewpage) {

    case "editproduct":
        if (isset($keys)) {
            $result = $engine->handleApiCall(API_URL, 'ghproductservices', 'GET', $payload = [], $search = [], $inputdata = $keys);

            if (!empty($result['id'])) {
                $productname = $result['name'];
                $category = $result['categorycode'];
                $subcategory = $result['subcategorycode'];
                $description = $result['description'];
                $price = $result['price'];
                $id = $result['id'];

                $results = $engine->handleApiCall(API_URL, 'ghcategory', 'GET', $payload = [], $search = ['code' => $category], $inputdata = '');
                if (!empty($results)) {
                    
                    $categoryname = $results['results'][0]['name'];
                    $categorycode = $results['results'][0]['code'];
                   

                }
                $resulte = $engine->handleApiCall(API_URL, 'ghsubcategory', 'GET', $payload = [], $search = ['code' => $subcategory, 'categorycode' => $category], $inputdata = '');
                if (!empty($resulte)) {
                    
                    $subcategoryname = $resulte['results'][0]['name'];
                    $subcategorycode = $results['results'][0]['code'];
                   

                }
            }
        }

        break;

    case "saveproduct":
        $duplicatekeeper = $session->get("post_key");
        if ($microtime != $duplicatekeeper) {
            $session->set("post_key", $microtime);

            if (!empty($productname) && !empty($price) && !empty($category) && !empty($subcategory) && !empty($description)) {

                // $level = (int)$userlevel;
                if (!empty($keys)) {
                    $payload = [
                        'name' => $productname,
                        'categorycode' => $category,
                        'subcategorycode' => $subcategory,
                        'description' => $description,
                        'price' => $price
                    ];
                    $result = $engine->handleApiCall(API_URL, 'ghproductservices', 'PATCH', $payload, $search = [], $keys);
                    if ($result['id']) {
                        // $productcode = $result['code'];

                        $msg = "Product updated successfully.";
                        $status = "success";
                        $view = "";
                    } else {
                        $msg = "An internal error was encountered.";
                        $status = "error";
                        $view = "add";
                    }
                } else {
                    $search = ['name' => $productname, 'description' => $description, 'categorycode' => $category, 'subcategorycode' => $subcategory, 'price' => $price];
                    $result = $engine->handleApiCall(API_URL, 'ghproductservices', 'GET', $payload = [], $search, $inputdata = '');

                    if ($result['count'] < 1) {
                            $payload = [
                                'code' => 'PRO-'.time(),
                                'name' => $productname,
                                'categorycode' => $category,
                                'subcategorycode' => $subcategory,
                                'description' => $description,
                                'price' => $price,
                                'dateadded' => $startdate
                                
                            ];
                            $result = $engine->handleApiCall(API_URL, 'ghproductservices', 'POST', $payload, $search = [], $inputdata = "");

                            if ($result['id']) {
                                // $productcode = $result['code'];

                                $msg = "Product added successfully.";
                                $status = "success";
                                $view = "";
                            } else {
                                $msg = "An internal error was encountered.";
                                $status = "error";
                                $view = "add";
                            }
                    } else {
                        $msg = "A product already exists with the same credentials.";
                        $status = "error";
                        $view = "add";
                    }
                }
            } else {
                $msg = "Required fields can not be empty!";
                $status = "error";
                $view = "add";
            }
        }
        break;


    case "reset":
        $fdsearch = $action_search = "";
        break;
}

// include 'model/js.php';

$limit = (!isset($limit) ? $session->get("limited") : (empty($limit) ? $limit = 20 : ""));
$session->set("limited", $limit);
$lenght = 10;
$offset = (isset($offset) && !empty($offset)) ? $offset : '0';

if (isset($action_search) && $action_search == "search") {
    if (!empty($fdsearch)) {
        $search = ["search" => $fdsearch, "status" => 1, "limit" => $limit, "offset" => ((int)$offset)];
    }
} else {
    $search = ["status" => 1, "limit" => $limit, "offset" => ((int)$offset)];
}

$target = "ghproductservices";
$method = "GET";
$payload = [];
$inputdata = "";
// $result = $engine->handleApiCall(API_URL, $target, $method, $payload, $search, $inputdata);

// $paging = new OS_Pagination($result, $limit, $lenght);

// $categories = $engine->handleApiCall(API_URL, 'ghcategory', 'GET', $payload = [], $search = ['status' => 1], $inputdata = '');
// $categorylist = $categories['results'];

