<?php
class engineClass
{
    //put your code here
    public  $sql;
    public $session;
    public $phpmailer;
    public $client;
    public $mail;
    function  __construct()
    {
        global $sql, $session, $phpmailer, $client;
        $this->session = $session;
        $this->sql = $sql;
        $this->phpmailer = $phpmailer;
        $this->client = $client;
        // $this->mail = new Mail();
    }

    /**
     * This function is use to return actors full details
     * @return <object>
     */
    public function getActorsDetails()
    {
        $actor_id = $this->session->get("userid");
        $stmt = $this->sql->Prepare("SELECT * FROM phys_users WHERE USR_CODE = " . $this->sql->Param('a'));
        $stmt = $this->sql->Execute($stmt, array($actor_id));
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject();
        } else {
            // print $this->sql->ErrorMsg();
            return false;
        }
    } //end of getActorsDetails

    /**
     * this function is use to return actors full name.
     * @return <string>
     */
    public function getActorName()
    {

        $obj = $this->getActorsDetails();
        return $obj->USR_OTHERNAME . ' ' . $obj->USR_SURNAME;
    } // end getActorName

    public function getActorLevel()
    {
        $obj = $this->getActorsDetails();
        return $obj->USR_LEVEL;
    } //end of getActorLevel

    /*
     * Get all branches
     */
    public function getAllBranch()
    {
        $stmt = $this->sql->Prepare("SELECT * FROM Pysio_branch WHERE BRCH_STATUS = '1' ");
        $stmt = $this->sql->Execute($stmt, array());
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt;
        } else {
            return false;
        }
    }

    public function categoryName()
    {
        $stmt = $this->sql->Prepare("SELECT * FROM EstimateCat WHERE CAT_STATUS = '1' ");
        $stmt = $this->sql->Execute($stmt, array());
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt;
        } else {
            return false;
        }
    }
public function getAllbookrecords()
    {
        $stmt = $this->sql->Prepare("SELECT * FROM BookingRecord WHERE Bk_STATUS = '1' ");
        $stmt = $this->sql->Execute($stmt, array());
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt;
        } else {
            return false;
        }
    }

    public function getAllScheme()
    {
        $stmt = $this->sql->Prepare("SELECT * FROM BookingRecord WHERE Bk_STATUS = '1' ");
        $stmt = $this->sql->Execute($stmt, array());
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt;
        } else {
            return false;
        }
    }

    public function getActorBranch()
    {
        $obj = $this->getActorsDetails();
        return $obj->USR_BRCHID;
    } //end of getActorLevel   

    public function getDateFormat($inputdate, $format = "Y-m-j")
    {
        //echo '. '.$inputdate."<br/>";
        $input = explode("/", $inputdate);
        $mk = $input[2] . '-' . $input[1] . '-' . $input[0];
        if ($format == "j/m/Y") {
            $input = explode("-", $inputdate);
            $mk = $input[2] . '/' . $input[1] . '/' . $input[0];
        }
        return $mk;
    }

    public function getDateFormatX($inputdate, $format = "Y-m-j")
    {
        //echo '. '.$inputdate."<br/>";
        $input = explode("/", $inputdate);
        $mk = $input[2] . '-' . $input[1] . '-' . $input[0];
        if ($format == "j/m/Y") {
            $input = explode("-", $inputdate);
            $mk = $input[2] . '/' . $input[1] . '/' . $input[0];
        }
        return $mk;
    }

    //genera estimate ID
    function estimateCode() {
    $randomNumber = str_pad(rand(0, 999999), 5, '0', STR_PAD_LEFT);

    // Create a unique identifier based on the current date and random 6-digit number
    $estimateID = 'EST' . $randomNumber;

    return $estimateID;
}

    //genera Booking ID
    function BookingID() {
    $randomNumber = str_pad(rand(0, 999999), 7, '0', STR_PAD_LEFT);

    // Create a unique identifier based on the current date and random 6-digit number
    $bookcode = 'BKL' . $randomNumber;

    return $bookcode;
}

    //genera therapistsID ID
    function therapistsID() {
    $randomNumber = str_pad(rand(0, 999999), 5, '0', STR_PAD_LEFT);

    // Create a unique identifier based on the current date and random 6-digit number
    $therapistsID = 'T' . $randomNumber;

    return $therapistsID;
}

    //genera frontDeskID ID
    function frontDeskID() {
    $randomNumber = str_pad(rand(0, 999999), 5, '0', STR_PAD_LEFT);

    // Create a unique identifier based on the current date and random 6-digit number
    $fdid = 'FD' . $randomNumber;

    return $fdid;
}
public function getTherapistName($therapistid)
    {
        $stmt = $this->sql->Prepare("SELECT FIRST_NAME,LAST_NAME FROM therapists WHERE THERAPISTS_ID = " . $this->sql->Param('a') . " ");
        $stmt = $this->sql->Execute($stmt, array($therapistid));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            $obj = $stmt->FetchNextObject();
            return $obj->FIRST_NAME. "  " . $obj->LAST_NAME;
        } else {
            return false;
        }
    }
   /**
     * desc : this function use to record all events on the system.ref the event type for info on type of events in the system
     * @param <string> $event_type
     * @param <string> $activity
     */
    public function setEventLog($event_type, $activity)
    {
        $userid = $this->session->get("userid");
        $userid = (empty($userid)) ? "-1" : $userid;

        $ufullname = $this->session->get('loginuserfulname');
        $toinsetsession = $this->session->getSessionID();

        $server = $_SERVER;
        unset($server['CONTEXT_DOCUMENT_ROOT']);
        unset($server['PATH']);
        unset($server['SystemRoot']);
        unset($server['SERVER_ADMIN']);
        unset($server['DOCUMENT_ROOT']);
        unset($server['SERVER_SOFTWARE']);
        unset($server['SERVER_SIGNATURE']);
        $ser = serialize($server);

        $remoteip = $_SERVER['REMOTE_ADDR'];
        $useragent = $_SERVER['HTTP_USER_AGENT'];

        $query = "INSERT INTO eventlog (EVL_EVTCODE,EVL_MOD_MEMID,EVL_MON_NAME,EVL_ACTIVITIES,EVL_IP,EVL_SESSION_ID,EVL_BROWSER,EVL_RAW) VALUES (" . $this->sql->Param('a') . "," . $this->sql->Param('b') . "," . $this->sql->Param('c') . "," . $this->sql->Param('d') . "," . $this->sql->Param('e') . "," . $this->sql->Param('f') . "," . $this->sql->Param('g') . "," . $this->sql->Param('h') . ")";

        $stmt = $this->sql->Execute($query, array($event_type, $userid, $ufullname, $activity, $remoteip, $toinsetsession, $useragent, $ser));
    } //end
    public function getSettingsValue($search_key, $input_array)
    {
        foreach ($input_array as $key) {
            if ($key['ST_TYPE'] == $search_key) {
                return $key['ST_VALUE'];
                break;
            }
        }
    }
    /**
     * desc : this function is use to show messages
     * @param <type> $msg
     * @param <type> $status
     */
    public function msgBox($msg, $status)
    {
        if (!empty($status)) {
            echo '<div class="messages">';
            if ($status == "success") {
                echo '<div class="alert alert-success alert-dismissible">
                 ' . $msg . '</div>';
            } else {
                echo ' <div class="alert alert-danger alert-dismissible">
                 ' . $msg . '</div>';
            }
            echo ' </div>';
        }
    }


    public function buildDropDown($list_array, $name, $seleted = "", $firstmgs = "", $script = "", $returnstyle = "")
    {
        $output_str = "";

        if ($returnstyle == "string") {
            $output_str = '<select id="' . $name . '" name="' . $name . '" ' . ((!empty($script)) ? $script : "") . '>';
        } else {
            echo '<select id="' . $name . '" name="' . $name . '" ' . ((!empty($script)) ? $script : "") . '>';
        }

        if (is_array($firstmgs) && !empty($firstmgs)) {
            if ($returnstyle == "string") {
                $output_str .=  '<option value="' . $firstmgs[0] . '" >' . $firstmgs[1] . '</option>';
            } else {
                echo '<option value="' . $firstmgs[0] . '" >' . $firstmgs[1] . '</option>';
            }
        } else {
            if ($returnstyle == "string") {
                $output_str .= '<option value=""></option>';
            } else {
                echo '<option value=""></option>';
            }
        }


        if (is_array($list_array)) {
            $i = 0;

            foreach ($list_array as $parse_array) {
                $parse_array = array_values($parse_array);

                if ($returnstyle == "string") {
                    $output_str .= '<option value="' . $parse_array[0] . '" ' . (($seleted == $parse_array[0]) ? 'selected="selected"' : '') . '>' . $parse_array[1] . '</option>';
                } else {
                    echo '<option value="' . $parse_array[0] . '" ' . (($seleted == $parse_array[0]) ? 'selected="selected"' : '') . '>' . $parse_array[1] . '</option>';
                }
            }
        }
        if ($returnstyle == "string") {
            $output_str .= '</select>';
        } else {
            echo '</select>';
        }
        if ($returnstyle == "string") {
            return  $output_str;
        }
    }

    /*
     * Get all Category
     */
    public function getAllCategories()
    {
        $stmt = $this->sql->Prepare("SELECT * FROM Categories WHERE CAT_STATUS = '1' ");
        $stmt = $this->sql->Execute($stmt, array());
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt;
        } else {
            return false;
        }
    }
    public function getCategoryDes()
    {
        $stmt = $this->sql->Prepare("SELECT * FROM Categories WHERE CAT_STATUS = '1' ");
        $stmt = $this->sql->Execute($stmt, array());
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt;
        } else {
            return false;
        }
    }
     /*
     * Get Specific Category
     */
    public function getCategoryCode()
{
    $stmt = $this->sql->Prepare("SELECT CAT_CODE FROM Categories WHERE  CAT_STATUS = '1' ");
        $stmt = $this->sql->Execute($stmt, array());
    print $this->sql->ErrorMsg();
    if ($stmt && ($stmt->RecordCount() > 0)) {
        return $stmt->FetchNextObject()->CAT_CODE;
    } else {
        return false;
    }
}


    /*
 * Convert numbers to words
 */

    public function NumberToWords($num)
    {

        $ones = array(
            1 => "one",
            2 => "two",
            3 => "three",
            4 => "four",
            5 => "five",
            6 => "six",
            7 => "seven",
            8 => "eight",
            9 => "nine",
            10 => "ten",
            11 => "eleven",
            12 => "twelve",
            13 => "thirteen",
            14 => "fourteen",
            15 => "fifteen",
            16 => "sixteen",
            17 => "seventeen",
            18 => "eighteen",
            19 => "nineteen"
        );
        $tens = array(
            1 => "ten",
            2 => "twenty",
            3 => "thirty",
            4 => "forty",
            5 => "fifty",
            6 => "sixty",
            7 => "seventy",
            8 => "eighty",
            9 => "ninety"
        );
        $hundreds = array(
            "hundred",
            "thousand",
            "million",
            "billion",
            "trillion",
            "quadrillion"
        ); //limit t quadrillion 
        $num = number_format($num, 2, ".", ",");
        $num_arr = explode(".", $num);
        $wholenum = $num_arr[0];
        $decnum = $num_arr[1];
        $whole_arr = array_reverse(explode(",", $wholenum));
        krsort($whole_arr);
        $rettxt = "";
        foreach ($whole_arr as $key => $i) {
            if ($i < 20) {
                $rettxt .= $ones[$i];
            } elseif ($i < 100) {
                $rettxt .= $tens[substr($i, 0, 1)];
                $rettxt .= " " . $ones[substr($i, 1, 1)];
            } else {
                $rettxt .= $ones[substr($i, 0, 1)] . " " . $hundreds[0];
                $rettxt .= " " . $tens[substr($i, 1, 1)];
                $rettxt .= " " . $ones[substr($i, 2, 1)];
            }
            if ($key > 0) {
                $rettxt .= " " . $hundreds[$key] . " ";
            }
        }
        if ($decnum > 0) {
            $rettxt .= " Ghana Cedis and ";
            if ($decnum < 20) {
                $rettxt .= $ones[$decnum];
            } elseif ($decnum < 100) {
                $rettxt .= $tens[substr($decnum, 0, 1)];
                $rettxt .= " " . $ones[substr($decnum, 1, 1)];
            }
        }
        return $rettxt;
    }



    public function getRegionName($regcode)
    {
        $stmt = $this->sql->Execute($this->sql->Prepare("SELECT * FROM dlms_region WHERE REG_ID = " . $this->sql->Param('a') . " "), array($regcode));
        print $this->sql->ErrorMsg();

        if ($stmt) {
            $obj = $stmt->FetchNextObject();
            $regionname = $obj->REG_NAME;

            return $regionname;
        } else {
            // print $this->sql->ErrorMsg();
            return false;
        }
    }

    /*
     * Get all Levels
     */
    public function getAllLevel()
    {
        $stmt = $this->sql->Prepare("SELECT * FROM actors_level WHERE ACL_STATUS = '1' ");
        $stmt = $this->sql->Execute($stmt, array());
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt;
        } else {
            return false;
        }
    }

    public function generateUniqueID($table, $col, $prefix)
    {

        $stmt = $this->sql->Execute($this->sql->Prepare("SELECT $col FROM $table ORDER BY $col DESC LIMIT 1"), array());
        print $this->sql->ErrorMsg();
        $actualdate = date('Ymdi');
        $randdigits = rand(10, 99);
        if ($stmt) {
            if ($stmt->RecordCount() > 0) {
                $obj = $stmt->FetchNextObject();

                $altvar = $obj->$col;
                $altcode = substr($altvar, strpos($altvar, '-') + 1);

                if (!empty($altcode)) {
                    $altcode = $altcode + 1;
                } else {
                    $altcode = 1;
                }

                if (strlen($altcode) == 1) {
                    $altcode = '000000' . $altcode;
                } elseif (strlen($altcode) == 2) {
                    $altcode = '00000' . $altcode;
                } elseif (strlen($altcode) == 3) {
                    $altcode = '0000' . $altcode;
                } elseif (strlen($altcode) == 4) {
                    $altcode = '000' . $altcode;
                } elseif (strlen($altcode) == 5) {
                    $altcode = '00' . $altcode;
                } elseif (strlen($altcode) == 6) {
                    $altcode = '0' . $altcode;
                }
                return $altstrg = $prefix . $actualdate . $randdigits . '-' . $altcode;
            } else {
                return $altstrg = $prefix . $actualdate . $randdigits . '-0000001';
            }
        } else {
            return false;
        }
    }


    public function generateCode($table, $prefix, $code_column)
    {
        $code_column = strtoupper($code_column);
        $final = uniqid($prefix);
        #check if code already exists
        $stmt = $this->sql->Execute($this->sql->Prepare("SELECT {$code_column}  FROM {$table} WHERE {$code_column}={$this->sql->Param('a')} LIMIT 1"), [$final]);
        if ($stmt->RecordCount() > 0) {
            return  $this->generateCode($table, $prefix, $code_column);
        }

        return $final;
    }

/*
     * Get all Treatment
     */
    public function getAllTreatment()
    {
        $stmt = $this->sql->Prepare("SELECT * FROM treatmentTable WHERE TREATMENT_STATUS = '1' ");
        $stmt = $this->sql->Execute($stmt, array());
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt;
        } else {
            return false;
        }
    }

    /*
     * Get all Physiotherapist
     */
    public function getAllTherapists()
    {
        $stmt = $this->sql->Prepare("SELECT * FROM therapists WHERE T_STATUS = '1' ");
        $stmt = $this->sql->Execute($stmt, array());
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt;
        } else {
            return false;
        }
    }

    
      // PatientID 
    public function getPatientID($pcode)
    {
        $stmt = $this->sql->Prepare("SELECT PATIENTID FROM Patients WHERE P_STATUS = " . $this->sql->Param('a') . " ");
        $stmt = $this->sql->Execute($stmt, array($pcode));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject()->PATIENTID;
        } else {
            return false;
        }
    }

    /*
     * Get all PatientsName
     */
public function getAllRoom()
{
    $stmt = $this->sql->Prepare("SELECT * FROM Rooms WHERE RoomStatus = '1' ORDER BY RoomNumber ASC");
    $stmt = $this->sql->Execute($stmt);

    if ($this->sql->ErrorMsg()) {
        print $this->sql->ErrorMsg();
    }

    if ($stmt && ($stmt->RecordCount() > 0)) {
        return $stmt;
    } else {
        return false;
    }
}



    public function getAllFeecharges()
    {
        $stmt = $this->sql->Prepare("SELECT * FROM accounts WHERE CP_SCHEMETIER = '1' ");
        $stmt = $this->sql->Execute($stmt, array());
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt;
        } else {
            return false;
        }
    }

    

    public function getAllFees()
    {
        $stmt = $this->sql->Prepare("SELECT * FROM daa_accounts WHERE CP_SCHEMETIER = '1' ");
        $stmt = $this->sql->Execute($stmt, array());
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt;
        } else {
            return false;
        }
    }

    public function getAllTenure()
    {
        $stmt = $this->sql->Prepare("SELECT TEN_DURATION, TEN_CODE FROM daa_tenure WHERE TEN_STATUS = '1' ");
        $stmt = $this->sql->Execute($stmt, array());
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt;
        } else {
            return false;
        }
    }

    function getAllMonths()
    {
        $months = array();
        for ($i = 1; $i <= 12; $i++) {
            $month = date('F', mktime(0, 0, 0, $i, 1));
            $months[$i] = $month;
        }
        return $months;
    }


    public function generateUniqKey($table, $prefix, $col)
    {
        $stmt = $this->sql->Execute($this->sql->Prepare("SELECT $col FROM $table ORDER BY $col DESC LIMIT 1"), array());
        print $this->sql->ErrorMsg();
        if ($stmt) {
            if ($stmt->RecordCount() > 0) {
                $obj = $stmt->FetchNextObject();

                $altvar = $obj->$col;
                $altcode = substr($altvar, 3);

                $altcode = $altcode + 1;

                if (strlen($altcode) == 1) {
                    $altcode = '000' . $altcode;
                } elseif (strlen($altcode) == 2) {
                    $altcode = '00' . $altcode;
                } elseif (strlen($altcode) == 3) {
                    $altcode = '0' . $altcode;
                }
                return $altstrg = $prefix . $altcode;
            } else {
                return $altstrg = $prefix . '0001';
            }
        } else {
            return false;
        }
    }


    /**
     *
     * @param <type> $setting_type
     * @return <type>
     */
    //   public function getSetValue($setting_type){
    //     $stmt = $this->sql->Prepare("SELECT ST_VALUE FROM sp_settings WHERE ST_TYPE =".$this->sql->Param('a'));
    //     $stmt = $this->sql->Execute($stmt,array($setting_type));
    //     if($stmt->RecordCount() > 0){
    //         $obj = $stmt->FetchNextObject();
    //         return $obj->ST_VALUE;
    //     }else{
    //         return false;
    //     }

    //     }//end


    /*
      * Get total portfolio
      */

    public function getSessionCode($month, $year, $accountcode)
    {
        $stmt = $this->sql->Prepare("SELECT CON_SESSIONCODE FROM daa_contributions WHERE CON_MONTH = " . $this->sql->Param('a') . " AND CON_YEAR = " . $this->sql->Param('b') . " AND CON_COMPCODE = " . $this->sql->Param('c') . "");
        $stmt = $this->sql->Execute($stmt, array(trim($month), trim($year), trim($accountcode)));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject()->CON_SESSIONCODE;
        } else {
            $random_string = uniqid('con');
            return $random_string;
        }
    }

    public function getAccountNo($mid)
    {
        $stmt = $this->sql->Prepare("SELECT CP_ACCOUNTNO FROM daa_accounts  WHERE CP_CODE = " . $this->sql->Param('a') . "  ");
        $stmt = $this->sql->Execute($stmt, array($mid));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject()->CP_ACCOUNTNO;
        } else {
            return false;
        }
    }

    public function getAccountNum($memid)
    {
        $stmt = $this->sql->Prepare("SELECT daa_accounts.CP_ACCOUNTNO FROM daa_members JOIN daa_accounts ON M_COMPANYID = daa_accounts.CP_ID WHERE M_APP_NO = " . $this->sql->Param('a') . " AND M_STATUS = '1' ");
        $stmt = $this->sql->Execute($stmt, array($memid));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject()->CP_ACCOUNTNO;
        } else {
            return false;
        }
    }

    public function convertExcelDate($fromExcel)
    {
        $date = date("Y-m-d", ((int)$fromExcel - 25569) * 86400);
        return $date;
    }





    public function getAccountName($accountcode)
    {
        $stmt = $this->sql->Prepare("SELECT CP_NAME FROM daa_accounts WHERE CP_CODE = " . $this->sql->Param('a') . " ");
        $stmt = $this->sql->Execute($stmt, array($accountcode));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject()->CP_NAME;
        } else {
            return false;
        }
    }

    public function getMemAccNo($accountcode)
    {
        $stmt = $this->sql->Prepare("SELECT M_COMPANYCODE FROM daa_members WHERE M_APP_NO = " . $this->sql->Param('a') . " ");
        $stmt = $this->sql->Execute($stmt, array($accountcode));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject()->M_COMPANYCODE;
        } else {
            return false;
        }
    }


    public function getCompanyDetails($accno)
    {
        $stmt = $this->sql->Prepare("SELECT * FROM daa_accounts WHERE CP_CODE = " . $this->sql->Param('a') . " ");
        $stmt = $this->sql->Execute($stmt, array($accno));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject();
        } else {
            return false;
        }
    }
    /* 
This function is to get the total members of an account
**/
    public function getTotalMemAcc($companycode)
    {
        $stmt = $this->sql->prepare("SELECT COUNT(M_APP_NO) AS TOTAL FROM daa_members WHERE M_COMPANYCODE = " . $this->sql->Param('a') . " AND M_STATUS IN ('1','4') AND M_AUTHORIZED IN ('1','2','3','-2')");
        $stmt = $this->sql->Execute($stmt, array($companycode));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject()->TOTAL;
        } else {
            return false;
        }
    }

    /* 
  This is to get the total contribution of an account
  **/
    public function getTotalAccCont($companycode)
    {
        $stmt = $this->sql->prepare("SELECT SUM(CON_TOTAL) AS TOTAL FROM daa_contributions WHERE CON_COMPCODE = " . $this->sql->Param('a') . " AND CON_STATUS= '1' AND CON_APP_STATUS = '1'");
        $stmt = $this->sql->Execute($stmt, array($companycode));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject()->TOTAL;
        } else {
            return false;
        }
    }

    public function getSixtyYearsDate($dob)
    {
        $age = explode("-", $dob);
        $year = $age[0]; //get the year
        $month = $age[1]; //get the month
        $day = $age[2]; //get the day

        $birth_year =  (int)$year;
        $sixtieth_year = $birth_year + 60;

        return "$sixtieth_year-$month-$day";
    }

    public function getOneMonthAfterSixtyYearsDate($dob)
    {
        $sixtiethdate = $this->getSixtyYearsDate($dob);
        $explode_sixtieth = explode("-", $sixtiethdate);
        $sixtieth_year = (int)$explode_sixtieth[0];
        $sixtieth_month = $explode_sixtieth[1];
        $sixtieth_day = $explode_sixtieth[2];
        if ($sixtieth_month == "12") {
            $new_month = "01";
            $new_year = $sixtieth_year + 1;

            return "$new_year-$new_month-$sixtieth_day";
        } else {
            $intnew_month = (int)$sixtieth_month + 1;
            $new_month = (string)$intnew_month;
            if (strlen($new_month) == 1) {
                $month = "0" . $new_month;
            } else {
                $month = $new_month;
            }

            return "$sixtieth_year-$month-$sixtieth_day";
        }
    }

    public function getMonths($startdate, $enddate)
    {
        $ts1 = strtotime($startdate);
        $ts2 = strtotime($enddate);

        $year1 = date('Y', $ts1);
        $year2 = date('Y', $ts2);

        $month1 = date('m', $ts1);
        $month2 = date('m', $ts2);

        $diff = (((int)$year2 - (int)$year1) * 12) + ((int)$month2 - (int)$month1);
        return $diff;
    }


    public function sendNewSMS($to, $msg)
    {

        //$to = $this->validateNumber($to);

        $query = array(
            "clientid" => SMS_CLIENT_ID,
            "clientsecret" => SMS_CLIENT_SECRET,
            "from" => "Daakye",
            "to" => $to,
            "content" => $msg
        );

        $curl = curl_init();

        curl_setopt_array($curl, [
            CURLOPT_URL => "httpsss://smsc.hubtel.com/v1/messages/send?" . http_build_query($query),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CUSTOMREQUEST => "GET",
        ]);

        $response = curl_exec($curl);
        $error = curl_error($curl);

        curl_close($curl);

        if ($error) {
            //echo "cURL Error #:" . $error;
        } else {
            //echo $response;
        }
    }


    public function validateNumber($number)
    {
        // Country codes
        $cnumber = '';
        $ccodes = $this->countries();
        //die();
        // Clear all symbols
        $number = str_replace(' ', '', $number);
        $number = preg_replace('/[^\p{L}\p{N}\s]/u', '', $number);
        $number = preg_replace('/^00/', '', $number);
        foreach ($ccodes as $ccode) {
            $cnumber = '*';
            if (preg_match('/^' . $ccode . '/', $number) == true) {
                $cnumber = $ccode;
            }
        }
        if (is_numeric($number)) {
            if ($cnumber == 233 || $cnumber == '*') {
                $carriers = array('023', '024', '054', '055', '027', '057', '028', '028', '020', '050', '026', '056');
                if (strlen($number) >= 9) {
                    if (strlen($number) == 12) {
                        // Get the country code
                        $ccode = substr($number, 0, 3);
                        // Check country code
                        if (in_array($ccode, $ccodes)) {
                            return $number;
                        } else {
                            return 'ERR: Invalid country code';
                        }
                    } else if (strlen($number) == 9) {
                        return $this->validateNumber('0' . substr($number, 0, 9));
                    } else  if (strlen($number) == 10) {
                        $carrier = substr($number, 0, 3);
                        if (in_array($carrier, $carriers)) {
                            return '233' . substr($number, 1, 9);
                        } else {
                            return 'ERR: Invalid carrier';
                        }
                    } else if (strlen($number) == 11) {
                        return 'ERR: The length of the number is incorrect';
                    } else if (strlen($number) == 13) {
                        $ccode = substr($number, 0, 3);
                        if (in_array($ccode, $ccodes)) {
                            return $number;
                        } else {
                            return 'ERR: Invalid country code';
                        }
                    }
                } else {
                    return 'ERR: The length of the number is incorrect';
                }
                if (strlen($number) > 13) {
                    return 'ERR: The length of the number is incorrect';
                }
            } else {
                return $number;
            }
        } else {
            return 'ERR: The number is not numeric';
        }
    } #end

    public function countries()
    {
        return array(
            '93', '355', '213', '1684', '376', '244', '1264', '1268', '54', '374', '297', '61', '43', '994', '1242', '973', '880', '1246', '375', '32', '501', '229', '1441', '975', '591', '387', '267', '55', '673', '359', '226', '257', '855', '237', '1', '238', '1345', '236', '235', '56', '86', '61', '57', '269', '242', '243', '682', '506', '385', '53', '357', '420', '225', '45', '253', '1767', '593', '20', '503', '240', '291', '372', '251', '500', '298', '679', '358', '33', '594', '689', '262', '241', '220', '995', '49', '233', '350', '30', '299', '1473', '590', '1671', '502', '44', '224', '245', '592', '509', '504', '852', '36', '354', '91', '62', '98', '964', '353', '972', '39', '1876', '81', '44', '962', '7', '254', '686', '850', '82', '996', '856', '371', '961', '266', '231', '218', '423', '370', '352', '853', '389', '261', '265', '60', '960', '223', '356', '692', '596', '222', '230', '262', '52', '691', '373', '377', '976', '382', '1664', '212', '258', '95', '264', '674', '977', '31', '687', '64', '505', '227', '234', '683', '672', '1670', '47', '968', '92', '680', '970', '507', '675', '595', '51', '63', '870', '48', '351', '787', '974', '40', '7', '250', '262', '590', '685', '378', '239', '966', '221', '381', '248', '232', '65', '421', '386', '677', '252', '27', '34', '94', '290', '1869', '1758', '249', '597', '47', '268', '46', '41', '963', '886', '992', '255', '66', '670', '228', '690', '676', '1868', '216', '90', '993', '1649', '688', '265', '380', '971', '44', '1', '598', '998', '678', '58', '84', '681', '212', '967', '260', '263'
        );
    }


    /*
 * This function is to get the name of the actor
 */

    public function getActorFullname($code)
    {
        $stmt = $this->sql->Prepare("SELECT * FROM phys_users WHERE USR_CODE = " . $this->sql->Param('a') . " ");
        $stmt = $this->sql->Execute($stmt, array($code));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            $obj = $stmt->FetchNextObject();
            return $obj->USR_OTHERNAME . "  " . $obj->USR_SURNAME;
        } else {
            return false;
        }
    }

    function addDaysToSpecificDate($inputDate, $numberToAdd)
    {
        // Convert input date to timestamp
        $timestamp = strtotime($inputDate);

        // Add the specified number of days (in seconds)
        $modifiedTimestamp = strtotime("+" . $numberToAdd . " days", $timestamp);

        // Get the result date in "Y-m-d" format
        $resultDate = date("Y-m-d", $modifiedTimestamp);

        return $resultDate;
    }

    public function getTotalMem($companycode)
    {
        $stmt = $this->sql->prepare("SELECT COUNT(M_APP_NO) AS TOTAL FROM daa_members WHERE M_COMPANYCODE = " . $this->sql->Param('a') . " AND M_STATUS IN ('1','4')");
        $stmt = $this->sql->Execute($stmt, array($companycode));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject()->TOTAL;
        } else {
            return false;
        }
    }
}
