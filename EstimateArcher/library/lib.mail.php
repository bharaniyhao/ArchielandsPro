<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require SPATH_PLUGINS . DS .'vendor/autoload.php';

class Mail{
    public $sql;
    public $session;
    private $mail;

    public function  __construct() {
        global $sql,$session;
        $this->session = $session;
        $this->sql = $sql;
        $this->mail = new PHPMailer(true);        
    }

    public function sendMail($subject, $recipientaddress, $mailcontent, $recipientname, $imagename, $file_name = "") {
        try { 
            //Server settings
            $this->mail->SMTPDebug  = SMTP::DEBUG_OFF;
            // $this->mail->isSMTP();
            $this->mail->Host       = 'mail.waystudio.com';
            $this->mail->SMTPAuth   = true;
            $this->mail->Username   = 'info@waystudio.com';
            $this->mail->Password   = 'fUx}6vg~]SWQ';
            $this->mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
            $this->mail->Priority   = 1;
            $this->mail->WordWrap   = 900;
            $this->mail->Port       = 465;

            //Recipients
            $this->mail->setFrom('info@waystudio.com', 'kofiandamam');
            $this->mail->addAddress($recipientaddress, $recipientname);
            $this->mail->addReplyTo('info@waystudio.com', 'kofiandamam');
            
            //$attachment = "media/uploads/codes/".$file_name;
            
            //$this->mail->addAttachment($attachment,'');

            //Content
            $this->mail->isHTML(true);
            $this->mail->Subject = $subject;
            $this->mail->Body    = "<table style=\"border-collapse:separate;background-color:#f6f6f6;width:100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td style=\"font-size:14px;vertical-align:top;\">&nbsp;</td><td style=\"font-size:14px;vertical-align:top;display:block;max-width:580px;padding:10px;width:580px;margin:0 auto!important\"><div style=\"box-sizing:border-box;display:block;margin:0 auto;max-width:580px;padding:10px\"> <span style=\"color:transparent;display:none;height:0;max-height:0;max-width:0;opacity:0;overflow:hidden;width:0\">This is preheader text. Some clients will show this text as a preview.</span><table style=\"border-collapse:separate;width:100%!important;background:#fff;background-size:100% 99%;background-repeat:no-repeat;padding-bottom:20px\"><tbody><tr style=\"\"><td style=\"padding:0\"><img src=\"https://daakyepension.com/media/assets/images/{$imagename}\" alt=\"DaakyePensionTrust\" style=\"padding-left:6.5px;padding-right:6.5px;width: 98%;height: auto\" class=\"CToWUd\"></td></tr><tr><td style=\"font-size:14px;vertical-align:top;box-sizing:border-box;padding:20px\"><table style=\"border-collapse:separate;width:100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td style=\"font-family:'Assistant',Helvetica,Arial,sans-serif;font-size:14px;vertical-align:top\"><!-- start content -->{$mailcontent}<!-- end content --><p style=\"margin:0;font-size:14px;margin-bottom:10px;margin-top:20px;color:#716f6f\">Thanks,<br> DaakyePensionTrust</p><table style=\"border-collapse:separate;box-sizing:border-box;width:100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td style=\"font-size:14px;vertical-align:top;padding-bottom:15px\" align=\"left\"><table style=\"border-collapse:separate;width:100%;margin-top:20px\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td style=\"border-right:solid 1px #dddddd\"><a href=\"https://daakyetrust.com/\" rel=\"noopener noreferrer\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/search?q=ghana+loan+exchange\"><img src=\"https://daakyepension.com/media/assets/images/daakyelogo.jpeg\" alt=\"DaakyePensionTrust\" style=\"width: 10em;padding:10px\" class=\"CToWUd\"></a></td><td><table style=\"width:100%\"><tbody><tr><td colspan=\"2\"><p style=\"margin:0;font-size:12px;color:#818181;padding:0 0 0 10px\">For any further questions or concerns, contact us via any of the channels.</p></td></tr><tr><td style=\"border-right:solid 1px #dddddd;padding-left:10px;width:55%;vertical-align:top\"><p style=\"color:#f8971d;font-weight:300;margin:0;font-size:12px\"><a href=\"https://goo.gl/maps/RwVpsrXAAPQANy7R6\" target=\"_blank\" style=\"text-decoration:none;color:#f8971d\">Achimota ABC, 3rd Floor, Vodafone Retail Center, Achimota</a></p><p style=\"margin:0;font-size:12px;color:#818181\">Tel. (+233) 0302 408</p><p style=\"margin:0;font-size:12px;color:#818181\">Email: info@daakyetrust.com</p></td><td style=\"padding-left:10px;width:45%;vertical-align:top\"><p style=\"margin:0;font-size:12px;color:#818181\">Achimota ABC, Accra</p><p style=\"margin:0;font-size:12px;color:#818181\">Website: <a href=\"mailto:daakyepension.com\" style=\"color:#f8971d\" target=\"_blank\">www.daakyetrust.com</a></p><p style=\"margin:0;font-size:12px;color:#818181\"><a href=\"https://www.daakyetrust.com/\" style=\"color:#f8971d\" rel=\"noopener noreferrer\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/search?q=ghana+loan+exchange\"></a></p></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table><div style=\"clear:both;padding-top:10px;text-align:center;width:100%\"><table style=\"border-collapse:separate;width:100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td style=\"font-family:'Assistant',Helvetica,Arial,sans-serif;font-size:12px;vertical-align:top;color:#999999;text-align:center\"><br><ul style=\"display:inline\"><li style=\"display:inline;margin-right:10px\"><a href=\"#\" rel=\"noopener noreferrer\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/search?q=ghana+loan+exchange\"><img src=\"https://ci3.googleusercontent.com/proxy/e4pKXQZVRMANKRJ6MTYr_Nw7nRTiAhPl3qaQqoyqHgNnA_uHbwGeiLIC015K-8FVD9LwqSzvJMOJEw534IgO_KtononrQfZ6gdpJx4EbALG202YSgG1409Dj=s0-d-e1-ft#https://designs.hubtel.com/resources/img/social-media/facebook-grey.png\" class=\"CToWUd\"></a></li><li style=\"display:inline\"><a href=\"#\" rel=\"noopener noreferrer\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/search?q=ghanaloan+exchange\"><img src=\"https://ci6.googleusercontent.com/proxy/EuyrfJvM4pSKHaafC6FsMQU83DIPfQ5aAzWfNWtz_vyBUv3ft0PWmUQquoCzUKRQGsemR-dLFQBY5lv0RRIj37ndl5v7ZOMkpnSqzr3ASuJEFTKa5pvHhcY=s0-d-e1-ft#https://designs.hubtel.com/resources/img/social-media/twitter-grey.png\" class=\"CToWUd\"></a></li><li style=\"display:inline;margin-left:10px\"><a href=\"#\" rel=\"noopener noreferrer\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/search?q=ghanaloan+exchange\"><img src=\"https://ci3.googleusercontent.com/proxy/P3KwU2_ipQDFrXhOGD6Hj3I-6rgE1X5Xhnsbv4zyMJ6ir7dfxzVNrRU5kfl3y_i9y4SHQ6ILXxMfEoVi32gH5SXkG-JXlK1G2IlZXtv0vIUptpy8vNQND8dE9w=s0-d-e1-ft#https://designs.hubtel.com/resources/img/social-media/instagram-grey.png\" class=\"CToWUd\"></a></li></ul></td></tr><tr style=\"height:38px\"><td style=\"height:38px\" align=\"center\"><table width=\"auto\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\"><tbody><tr><td>&nbsp;</td><td><a style=\"text-decoration:none;color:#74787d;font-size: smaller;\">The content of this email is confidential and intended for the recipient specified in this message only. If you received this message by mistake, please ignore and delete it.</a></td><td width=\"4\">&nbsp;</td><td>&nbsp;</td></tr></tbody></table></td></tr></tbody></table></div> </div></td><td style=\"font-size:14px;vertical-align:top\">&nbsp;</td></tr></tbody></table>";            

            $this->mail->send();

            $this->mail->ClearAddresses();
            $this->mail->ClearAttachments();
            return FALSE;
        } catch (Exception $e) {
            return TRUE;
            echo "Mailer Error: {$this->mail->ErrorInfo}";
        }
    }

}

?>