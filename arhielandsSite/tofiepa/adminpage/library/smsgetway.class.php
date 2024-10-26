<?php
//include(SPATH_PLUGINS."/smsgh/Api.php");

class smsgetway{
	private $config;
	private $url;
	private $apiHost;
	private $apiMessage;

	
	function __construct(){
		global $config;
		$this->config=$config;
		/*$this->apiHost = new SmsghApi();
		$this->apiHost->setClientId($this->config->smsusername);
		$this->apiHost->setClientSecret($this->config->smspassword);
		$this->apiHost->setContextPath("v3");
		$this->apiHost->setHttps(true);
		$this->apiHost->setHostname($this->config->smsurl);
		$this->apiMessage = new ApiMessage();
		$this->apiMessage->setFrom('RPTPRS');*/
	}
	
	/**
	 * 
	 * @param string $phone
	 * @param string $msg
	 *
	public function sendSms($phone,$msg){
		$result = false;
		try {
			$this->apiMessage->setTo($phone);
			$this->apiMessage->setContent($msg);
			$this->apiMessage->setRegisteredDelivery(true);
			$response = $this->apiHost->getMessages()->send($this->apiMessage);
		
			$result = $response->getResponseStatus();
			
		
		} catch (Smsgh_ApiException $ex) {
			echo 'ERROR: ', $ex->message(), "\n";
		}
	return $result;
	}
	*/
	
	/**
	 * 
	 * @param string $phone
	 * @param string $msg
	 */
	public function sendSms($phone,$msg){
		//$url = 'http://txtconnect.co/api/send/';
		$url = 'https://smsc.hubtel.com/v1/messages/send';
		$result = false;
		$fields = array(
'token' => urlencode('d365dd3e5f898e8b6366f022bd1dcb0bb1ef4092'),
'msg' => urlencode($msg),
'from' => urlencode("RPTPRS"),
'to' => urlencode($phone),
);
$fields_string = "";
foreach ($fields as $key => $value) {
$fields_string .= $key . '=' . $value . '&';
}
rtrim($fields_string, '&');
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
curl_setopt($ch, CURLOPT_POST, count($fields));
curl_setopt($ch, CURLOPT_POSTFIELDS, $fields_string);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
$result = curl_exec($ch);
curl_close($ch);
$data = json_decode($result);
if($data->error == "0"){
$result = "200";
}else{
$result = $data->error;
}
		
		
	return $result;
	}
	
	/**
	 * sends same message in bulk
	 * @param array $arrayphone
	 * @param string $msg
	 */
	public function sendBulkSms($arrayphone,$msg){
		$returns =array();
		if(is_array($arrayphone)){
			foreach ($arrayphone as $phone){
				$returns[] =$this->sendSms($phone, $msg);
			}
		}else{
			$returns[] =$this->sendSms($phone, $msg);	
		}
		
		return $returns;
		
	}//end
}
?>