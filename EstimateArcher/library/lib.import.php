<?php
//require_once 'path/to/engineClass.php'; // Adjust the path to where the engineClass is defined

//error_reporting(E_ALL);
//ini_set('display_errors', 1);
class Import extends engineClass {
    // Your code here
    function __construct() {
        parent::__construct();
    }

    public function uploadImage($file, $destination) {
        if (is_uploaded_file($file['tmp_name']) && $file['error'] == 0) {
            $actualyear = date('Y');
            $ext = array('image/pjpeg', 'image/jpeg', 'image/jpg', 'image/png', 'image/x-png', 'image/gif');
            $rand_numb = md5(uniqid(microtime()));
            $neu_name = $actualyear . '_' . $rand_numb . $file['name'];
            $_name_ = $file['name'];
            $_type_ = $file['type'];
            $_tmp_name_ = $file['tmp_name'];
            $_size_ = $file['size'] / 1024;
            if (in_array($_type_, $ext)) {
                if (@move_uploaded_file($_tmp_name_, $destination . $neu_name)) {
                    return $neu_name;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public function uploadPdf($file, $destination) {
        if (is_uploaded_file($file['tmp_name']) && $file['error'] == 0) {
            $ext = array('application/pdf', 'application/download');
            $rand_numb = md5(uniqid(microtime()));
            $neu_name = $rand_numb . $file['name'];
            $_name_ = $file['name'];
            $_type_ = $file['type'];
            $_tmp_name_ = $file['tmp_name'];
            $_size_ = $file['size'] / 1024;
            if (in_array($_type_, $ext)) {
                if (@move_uploaded_file($_tmp_name_, $destination . $neu_name)) {
                    return $neu_name;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
}
?>
