<!-- <php
$crypt = new cryptCls();

$actorcode = $session->get("userid");
$actorname = $session->get("loginuserfulname");

$startdate = date("Y-m-d"); --
// $upload = new importClass();
// include 'model/js.php';

// $vendors = $engine->handleApiCall(API_URL, 'ghsellers', 'GET', $payload = [], $search = ['status' => 1], $inputdata = '');
// $totalvendors =  $vendors['count'];

// $orders = $engine->handleApiCall(API_URL, 'ghordertracking', 'GET', $payload = [], $search = [], $inputdata = '');
// $totalorders = $orders['count'];

// $cart = $engine->handleApiCall(API_URL, 'ghcart', 'GET', $payload = [], $search = [], $inputdata = '');

// $mostOrders = array();
// $mostCustomers = array();
// $topproducts = array();

// $totalTax = 0;
// foreach($orders['results'] as $val){
//     array_push($mostOrders, $val['sellercode']);
//     array_push($mostCustomers, $val['customercode']);
//     $totalTax += (float)$val['tax'];
// }

// foreach($cart['results'] as $val){
//     array_push($topproducts, $val['productcode']);
// }

// $countTopProducts = array_count_values($topproducts);
// $topSellingProductCount = max($countTopProducts);
// $topSellingProduct = $engine->getProductName(array_keys($countTopProducts, $topSellingProductCount));

//most popular vendors
// $countMostOrders = array_count_values($mostOrders);
// $mostVendorCodeCount = max($countMostOrders);
// $mostPopularVendor = $engine->getVendorName(array_keys($countMostOrders, $mostVendorCodeCount));

//most popular customers
// $countMostCustomers = array_count_values($mostCustomers);
// $mostCustomerCodeCount = max($countMostCustomers);
// $mostPopularCustomer = $engine->getCustomerName(array_keys($countMostCustomers, $mostCustomerCodeCount));


// $orderres = array_reverse(array_slice($orders['results'], -5, 5));

// $sales = $engine->handleApiCall(API_URL, 'ghordertracking', 'GET', $payload = [], $search = [], $inputdata = '');
// $totalsales = $sales['count'];
// $customerArray = array();
// $customers = $engine->handleApiCall(API_URL, 'ghcustomers', 'GET', $payload = [], $search = ['status' => '1'], $inputdata = '');
// // $totalcustomers = $customers['count'];
// foreach ($customers['results'] as $customer) {
//     array_push($customerArray, $customer['email']);
// }
// $totalcustomers = count(array_unique($customerArray));



//successful orders
// $ordersSuccess = $engine->handleApiCall(API_URL, 'ghordertracking', 'GET', $payload = [], $search = ['paystate' => '1'], $inputdata = '');

// $array1 = array();
// $array2 = array();
// foreach ($ordersSuccess['results'] as $ord) {
//     if (date('Y', strtotime($ord['orderdate'])) == date('Y')) {
//         if (empty($array1)) {
//             (int)$array1[date('n', strtotime($ord['orderdate']))] = (float)$ord['totalamount'];
//         } else {
//             (int)$array1[date('n', strtotime($ord['orderdate']))] += (float)$ord['totalamount'];
//         }
//     }
// }

//  print_r($array1); exit;
// for ($i = 0; $i < 12; $i++) {
//     if (array_key_exists($i + 1, $array1)) {
//         $array2[$i] = $array1[$i + 1];
//     } else {
//         $array2[$i] = 0;
//     }
// }

//  print_r($array2);
// $highest = 0;
// $lowest = $array2[0];
// $sum = 0;
// for ($i = 0; $i < count($array2); $i++) {
//     if ($array2[$i] > $highest) {
//         $highest = (float)$array2[$i];
//     }

//     if ($array2[$i] < $lowest) {
//         $lowest = (float)$array2[$i];
//     }

//     $sum += (float)$array2[$i];
// }

// $average = (float)$sum / count($array2);

// echo $highest . "<br>";
// echo $lowest . "<br>";
// echo $sum . "<br>";
// echo $average = (float)$sum / count($array2);





// $limit = (!isset($limit) ? $session->get("limited") : (empty($limit) ? $limit = 20 : ""));
// $session->set("limited", $limit);
// $lenght = 10;
// $offset = (isset($offset) && !empty($offset)) ? $offset : '0';

// if (isset($action_search) && $action_search == "search") {
//     if (!empty($fdsearch)) {
//         $search = ["search" => $fdsearch, "status" => 1, "limit" => $limit, "offset" => ((int)$offset)];
//     }
// } else {
//     $search = ["status" => 1, "limit" => $limit, "offset" => ((int)$offset)];
// }

// $target = "ghproductservices";
// $method = "GET";
// $payload = [];
// $inputdata = "";
// $result = $engine->handleApiCall(API_URL, $target, $method, $payload, $search, $inputdata);

// $paging = new OS_Pagination($result, $limit, $lenght);

// $categories = $engine->handleApiCall(API_URL, 'ghcategory', 'GET', $payload = [], $search = ['status' => 1], $inputdata = '');
// $categorylist = $categories['results'];
