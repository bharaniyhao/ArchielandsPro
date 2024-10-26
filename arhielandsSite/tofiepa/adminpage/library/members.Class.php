<?php
/* 
 * Developed By KAAD
 * Description:: Members and account classe
 */


class membersClass extends engineClass
{
    //put your code here
    private $activecompany;
    public $totalincome;
    public function  __construct()
    {
        parent::__construct();
    }

    public function getCompanyID($comp_code)
    {
        $stmt = $this->sql->Execute($this->sql->Prepare("SELECT CP_ID FROM daa_accounts WHERE CP_CODE =" . $this->sql->Param('a') . ""), array($comp_code));
        $obj = $stmt->FetchNextObject();
        $comp_id = $obj->CP_ID;
        return $comp_id;
    }


    public function setMemberUnqicNo($active_comp_id)
    {
        //Get company account number
        $stmt = $this->sql->Execute($this->sql->Prepare("SELECT CP_ACCOUNTNO FROM daa_accounts WHERE CP_CODE = " . $this->sql->Param('a') . " "), array($active_comp_id));
        $obj = $stmt->FetchNextObject();
        $compaccno = $obj->CP_ACCOUNTNO;

        //Get number of registered member under company from member
        $stmtmx = $this->sql->Execute($this->sql->Prepare("SELECT M_ID FROM daa_members WHERE M_COMPANYCODE = " . $this->sql->Param('a') . " "), array($active_comp_id));
        print $this->sql->ErrorMsg();
        $membcounterx = $stmtmx->RecordCount();

        //Get number of registered member under company from member_pipe
        $stmtm = $this->sql->Execute($this->sql->Prepare("SELECT M_ID FROM daa_members_pipe WHERE M_COMPANYCODE = " . $this->sql->Param('a') . " AND M_AUTHORIZED = '0' "), array($active_comp_id));
        print $this->sql->ErrorMsg();
        $membcounter = $stmtm->RecordCount();
        $uniqnumber = $membcounter + $membcounterx + 1;

        $rand = $compaccno . str_pad($uniqnumber, 2, '0', STR_PAD_LEFT);

        //check member id already in use
        $valid = 1;
        do {
            //echo $rand.' ==> ';
            $stml = $this->sql->Execute($this->sql->Prepare("SELECT M_ID FROM daa_members_pipe WHERE M_APP_NO = " . $this->sql->Param('a') . " "), array($rand));

            $stmlx = $this->sql->Execute($this->sql->Prepare("SELECT M_ID FROM daa_members WHERE M_APP_NO = " . $this->sql->Param('a') . " "), array($rand));
            //echo $stml->RecordCount();

            if ($stml->RecordCount() == 0 && $stmlx->RecordCount() == 0) {
                $valid = 0;
            } else {
                $uniqnumber = $uniqnumber + 1;

                $rand = $compaccno . str_pad($uniqnumber, 2, '0', STR_PAD_LEFT);
            }
        } while ($valid == 1);
        return $rand;
    } //END


    /**
     * Generate unqic account number for companies
     */
    public function setAccountUniqCode($actorbranchcode, $accounttype, $inputcategorylist = "")
    {
        $prefix = $this->getSetValue()->CP_MEMIDPREFIX;

        $stmt = $this->sql->Execute($this->sql->Prepare("SELECT CP_ID FROM daa_accounts ORDER BY CP_ID DESC LIMIT 1 "));
        print $this->sql->ErrorMsg();

        $obj = $stmt->FetchNextObject();
        $totalcount = $obj->CP_ID;
        $uniqnumber = $totalcount + 1;

        if (strlen($uniqnumber) == 1) {
            $uniqnumber = '0000' . $uniqnumber;
        } else if (strlen($uniqnumber) == 2) {
            $uniqnumber = '000' . $uniqnumber;
        } else if (strlen($uniqnumber) == 3) {
            $uniqnumber = '00' . $uniqnumber;
        } else if (strlen($uniqnumber) == 4) {
            $uniqnumber = '0' . $uniqnumber;
        }

        if ($accounttype == 2) {
            $accountnum = $prefix . $inputcategorylist . $actorbranchcode . $uniqnumber;
        } else if ($accounttype == 1) {
            $accountnum = $prefix . $actorbranchcode . $uniqnumber;
        }
        return $accountnum;
    } //END


    /**
     *
     * @param <type> $setting_type
     * @return <type>
     */
    public function getSetValue()
    {
        $stmt = $this->sql->Prepare("SELECT * FROM daa_compsettings");
        $stmt = $this->sql->Execute($stmt, array());
        if ($stmt->RecordCount() > 0) {
            return  $obj = $stmt->FetchNextObject();
        } else {
            return false;
        }
    } //end


    /*
     * Get total monthly contribution for account
	 * param:: @accountcode
     */

    public function getAcountDetails($accountcode)
    {
        $stmt = $this->sql->Prepare("SELECT SUM(M_MONTHLY_SALARY) AS TOTALCONT FROM daa_members WHERE M_COMPANYCODE = " . $this->sql->Param('a') . " AND M_STATUS IN ('1','4') AND M_AUTHORIZED IN ('1','2','3','-2') ");
        $stmt = $this->sql->Execute($stmt, array($accountcode));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject()->TOTALCONT * 5/100;
        } else {
            return false;
        }
    }

    public function getMemberCode($memberid)
    {
        $stmt = $this->sql->Prepare("SELECT M_APP_NO FROM daa_members WHERE M_ID = " . $this->sql->Param('a') . "");
        $stmt = $this->sql->Execute($stmt, array($memberid));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject()->M_APP_NO;
        } else {
            return false;
        }
    }

    public function getMCode($memberid)
    {
        $stmt = $this->sql->Prepare("SELECT M_CODE FROM daa_members WHERE M_APP_NO = " . $this->sql->Param('a') . "");
        $stmt = $this->sql->Execute($stmt, array($memberid));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject()->M_CODE;
        } else {
            return false;
        }
    }

    public function getMapCode($memberid)
    {
        $stmt = $this->sql->Prepare("SELECT M_MAPCODE FROM daa_members WHERE M_APP_NO = " . $this->sql->Param('a') . "");
        $stmt = $this->sql->Execute($stmt, array($memberid));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject()->M_MAPCODE;
        } else {
            return false;
        }
    }

    /*
     * Get total member contribution in the system
     */
    public function getMemberTotalContribution($membercode, $schemeid)
    {
        $stmt = $this->sql->Prepare("SELECT SUM(CON_EMPLOYEE + CON_EMPLOYER) AS TOTALCONT FROM daa_contributions WHERE CON_MAPCODE = " . $this->sql->Param('a') . " AND CON_SCHID = " . $this->sql->Param('b') . " AND CON_STATUS = '1' AND CON_APP_STATUS = '1' ");
        $stmt = $this->sql->Execute($stmt, array($membercode, $schemeid));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject()->TOTALCONT;
        } else {
            return false;
        }
    }

    public function getMemberTotalContributionWithMCODE($mcode, $schemeid)
    {
        $stmt = $this->sql->Prepare("SELECT SUM(CON_EMPLOYEE + CON_EMPLOYER) AS TOTALCONT FROM daa_contributions WHERE CON_MCODE = " . $this->sql->Param('a') . " AND CON_SCHID = " . $this->sql->Param('b') . " AND CON_STATUS = '1' AND CON_APP_STATUS = '1' ");
        $stmt = $this->sql->Execute($stmt, array($mcode, $schemeid));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject()->TOTALCONT;
        } else {
            return false;
        }
    }


    /*
     * Get total member contribution per a period
     */
    public function getMemberContribution($membercode, $schemeid, $enddate)
    {
        $stmt = $this->sql->Prepare("SELECT SUM(CON_EMPLOYEE + CON_EMPLOYER) AS TOTALCONT FROM daa_contributions WHERE CON_MAPCODE = " . $this->sql->Param('a') . " AND CON_SCHID = " . $this->sql->Param('b') . " AND CON_DATE <= " . $this->sql->Param('c') . " AND CON_STATUS = '1' AND CON_APP_STATUS = '1' ");
        $stmt = $this->sql->Execute($stmt, array($membercode, $schemeid, $enddate));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject()->TOTALCONT;
        } else {
            return false;
        }
    }


    /*
     * Get total member withdrawal
     */
    public function getMemberWithdrawal($membercode, $schemeid)
    {
        $stmt = $this->sql->Prepare("SELECT SUM(WITH_AMOUNT + WITH_CHARGES_AMT) AS TOTALWITH FROM daa_withdrawals WHERE WITH_MAPCODE = " . $this->sql->Param('a') . " AND WITH_SCHEMEID = " . $this->sql->Param('b') . " AND WITH_STATUS='1' AND WITH_APP_STATUS ='1' AND WITH_DISBURSED_STATUS = '1'");
        $stmt = $this->sql->Execute($stmt, array($membercode, $schemeid));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject()->TOTALWITH;
        } else {
            return false;
        }
    }

    public function getMemberWithdrawalWithMCODE($mcode, $schemeid)
    {
        $stmt = $this->sql->Prepare("SELECT SUM(WITH_AMOUNT + WITH_CHARGES_AMT) AS TOTALWITH FROM daa_withdrawals WHERE WITH_MCODE = " . $this->sql->Param('a') . " AND WITH_SCHEMEID = " . $this->sql->Param('b') . " AND WITH_STATUS='1' AND WITH_APP_STATUS ='1' AND WITH_DISBURSED_STATUS = '1' ");
        $stmt = $this->sql->Execute($stmt, array($mcode, $schemeid));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject()->TOTALWITH;
        } else {
            return false;
        }
    }

    /*
     * Get total member Interest
     */
    public function getMemberInterest($membercode, $schemeid)
    {
        $stmt = $this->sql->Prepare("SELECT SUM(INT_AMOUNT + INT_EMPLOYER_AMOUNT) AS TOTALINTEREST FROM daa_interestdetails WHERE INT_MAPCODE = " . $this->sql->Param('a') . " AND INT_SCHID = " . $this->sql->Param('b') . " ");
        $stmt = $this->sql->Execute($stmt, array($membercode, $schemeid));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject()->TOTALINTEREST;
        } else {
            return false;
        }
    }

    public function getMemberInterestWithMCODE($mcode, $schemeid)
    {
        $stmt = $this->sql->Prepare("SELECT SUM(INT_AMOUNT + INT_EMPLOYER_AMOUNT) AS TOTALINTEREST FROM daa_interestdetails WHERE INT_MCODE = " . $this->sql->Param('a') . " AND INT_SCHID = " . $this->sql->Param('b') . " ");
        $stmt = $this->sql->Execute($stmt, array($mcode, $schemeid));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject()->TOTALINTEREST;
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

    /*
     * Get total member Fees
     */
    public function getMemberFees($membercode, $schemeid)
    {
        $stmt = $this->sql->Prepare("SELECT SUM(FEE_AMOUNT) AS TOTALFEE FROM daa_dailyfees WHERE FEE_MEMMAPCODE = " . $this->sql->Param('a') . " AND FEE_SCHID = " . $this->sql->Param('b') . " ");
        $stmt = $this->sql->Execute($stmt, array($membercode, $schemeid));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject()->TOTALFEE;
        } else {
            return false;
        }
    }


    public function getMemberFeesWithMCODE($mcode, $schemeid)
    {
        $stmt = $this->sql->Prepare("SELECT SUM(FEE_AMOUNT) AS TOTALFEE FROM daa_dailyfees WHERE FEE_MEMBERCODE = " . $this->sql->Param('a') . " AND FEE_SCHID = " . $this->sql->Param('b') . " ");
        $stmt = $this->sql->Execute($stmt, array($mcode, $schemeid));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject()->TOTALFEE;
        } else {
            return false;
        }
    }


    /*
     * This function gets member benefit
     */

    public function getMemberBenefit($membercode, $schemeid, $enddate)
    {
        //get total contribution
        $contribution = $this->getMemberContribution($membercode, $schemeid, $enddate);
        //get total interest
        $interest = $this->getMemberInterest($membercode, $schemeid);
        //get total withdrawal
        $withdrawal = $this->getMemberWithdrawal($membercode, $schemeid);
        //get total fees
        $fees = $this->getMemberFees($membercode, $schemeid);

        $totalbenefit = $contribution + $interest - $withdrawal - $fees;

        return $totalbenefit;
    }

    

    public function getMemberBenefitWithMCODE($mcode, $schemeid, $enddate)
    {
        //get total contribution
        $contribution = $this->getMemberTotalContributionWithMCODE($mcode, $schemeid, $enddate);
        //get total interest
        $interest = $this->getMemberInterestWithMCODE($mcode, $schemeid);
        //get total withdrawal
        $withdrawal = $this->getMemberWithdrawalWithMCODE($mcode, $schemeid);
        //get total fees
        $fees = $this->getMemberFeesWithMCODE($mcode, $schemeid);

        $totalbenefit = $contribution + $interest - $withdrawal - $fees;

        return $totalbenefit;
    }

    /**
     * This function generates the member code
     */

    public function getClientCode($initial)
    {
        $initial = strtoupper($initial);
        $stmt = $this->sql->Prepare("SELECT * FROM hms_client_numbers WHERE PN_INITIALS= " . $this->sql->Param('a'));
        $stmt = $this->sql->Execute($stmt, array($initial));

        if ($stmt && ($stmt->RecordCount() > 0)) {

            $obj = $stmt->FetchNextObject();
            $pn_count = $obj->PN_COUNT;
            $pn_count = $pn_count + 1;
            if (strlen($pn_count) == 1) {
                $pn_code = $initial . '00' . $pn_count;
            } else if (strlen($pn_count) == 2) {
                $pn_code = $initial . '0' . $pn_count;
            } else {
                $pn_code = $initial . $pn_count;
            }

            $stmt = $this->sql->Execute($this->sql->Prepare("UPDATE hms_client_numbers SET PN_COUNT = " . $this->sql->Param('a') . " , PN_CODE = " . $this->sql->Param('b') . " WHERE PN_INITIALS = " . $this->sql->Param('c')), array($pn_count, $pn_code, $initial));
        } else {
            $pn_count = 1;
            $pn_code = $initial . "001";

            $this->sql->Execute($this->sql->Prepare("INSERT INTO hms_client_numbers (PN_CODE,PN_INITIALS,PN_COUNT) VALUES (" . $this->sql->Param('a') . "," . $this->sql->Param('b') . "," . $this->sql->Param('c') . ")"), array($pn_code, $initial, $pn_count));
            print $this->sql->ErrorMsg();
        }

        return $pn_code;
    } //end of getPatientNum

    /**
     * Get Member Details
     * @Param:: mapcode, mcode
     * **/

    public function getMemberDetails($mapcode, $mcode)
    {
        $stmt = $this->sql->Prepare("SELECT * FROM daa_members WHERE M_MAPCODE = " . $this->sql->Param('a') . " AND M_CODE = " . $this->sql->Param('a') . " ");
        $stmt = $this->sql->Execute($stmt, array($mapcode, $mcode));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject();
        } else {
            return false;
        }
    }

    
    public function getBeneficiaryDetails($mapcode, $mcode)
    {
        $stmt = $this->sql->Prepare("SELECT * FROM daa_beneficiary WHERE BENE_MAPCODE = " . $this->sql->Param('a') . " AND BENE_MEMCODE = " . $this->sql->Param('a') . " ");
        $stmt = $this->sql->Execute($stmt, array($mapcode, $mcode));
        print $this->sql->ErrorMsg();
        if ($stmt && ($stmt->RecordCount() > 0)) {
            return $stmt->FetchNextObject();
        } else {
            return false;
        }
    }

        public function getCompanyCode($memberid){
            $stmt = $this->sql->Prepare("SELECT M_COMPANYCODE FROM daa_members WHERE M_APP_NO = ".$this->sql->Param('a')."");
            $stmt = $this->sql->Execute($stmt, array($memberid));
            print $this->sql->ErrorMsg();
            if($stmt && ($stmt->RecordCount() > 0)){
                return $stmt->FetchNextObject()->M_COMPANYCODE;
            }else {
                return false;
            }
        }

        public function checkWithdrawals($mcode){
            $stmt = $this->sql->Prepare("SELECT * FROM daa_withdrawals WHERE WITH_MCODE = ".$this->sql->Param('a')." AND WITH_DISBURSED_STATUS = ".$this->sql->Param('a')."");
            $stmt = $this->sql->Execute($stmt, array($mcode, "1"));
            print $this->sql->ErrorMsg();
            if($stmt && ($stmt->RecordCount() > 0)){
                return true;
            }else {
                return false;
            }
        }

        public function getMemberInfo($mcode){
            $stmt = $this->sql->Prepare("SELECT * FROM daa_members WHERE M_CODE = ".$this->sql->Param('a')." ");
            $stmt = $this->sql->Execute($stmt, array($mcode));
            print $this->sql->ErrorMsg();
            if($stmt && ($stmt->RecordCount() > 0)){
                return $stmt->FetchNextObject();
            }else {
                return false;
            }
        }

        public function getPreserveEnddate($mcode){
            $stmt = $this->sql->Prepare("SELECT * FROM daa_addmemberpreserve_reason WHERE ADD_MCODE = ".$this->sql->Param('a')."");
            $stmt = $this->sql->Execute($stmt, array($mcode));
            print $this->sql->ErrorMsg();
            if($stmt && ($stmt->RecordCount() > 0)){
                if ($stmt->FetchNextObject()->ADD_STATUS == "1"){
                    return date("Y-m-d");
                }else{
                    return $stmt->FetchNextObject()->ADD_ENDDATE;
                }
            }else {
                return false;
            }
        }

        public function getUnclaimedEnddate($mcode){
            $stmt = $this->sql->Prepare("SELECT * FROM daa_withdrawals WHERE WITH_MCODE = ".$this->sql->Param('a')." AND WITH_DISBURSED_STATUS = ".$this->sql->Param('a')."");
            $stmt = $this->sql->Execute($stmt, array($mcode, "1"));
            print $this->sql->ErrorMsg();
            if($stmt && ($stmt->RecordCount() > 0)){
                return $stmt->FetchNextObject()->WITH_PAIDDATE;
            }else {
                return date("Y-m-d");
            }
        }
    
}
