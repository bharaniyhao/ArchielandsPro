<?php
#http://rodomontano.altervista.org/engcaptcha.php
ini_set('display_errors',0);
# Config


/* Set thick colored lines in background.
   0  no linear background.
   1  linear background.  
   */
$LinearBackgroud = 0;

/* Set granular noise.
   0  no granular noise.
   1  granular noise.  
   */
$GranularNoise = 0;


/* Set linear noise.
   0  no square noise.
   1  square noise.  
   */
$LinearNoise = 0;


/* Set square noise .
   0  no square noise.
   1  square noise.  
   */
$SquareNoise = 0;

/* Horizontal Character distortion.
   0  no distortion.
   1  distortion.  
   */
$distortion_hor = 0;


/* Vertical Character distortion.
   0  no distortion.
   1  distortion.  
   */
$distortion_ver = 0;


/* Character color select.
   0  All characters are black.
   1  random color.  
   */
$CharacterColorMode = 0;


/* subset of Security Code 
   0  User has to type the whole code.
   1  User has to type a subset of Code: only red characters 
   
   NOTE - This option is obviously not compatible with random color of characters 
   */
$subset = 0;


/* Character Phase Shift
   0  no staggering.
   1  staggering.  
   */
$staggering = 0;


/* Character size select. 
   0.5   character size randomizes from 50 to 100%.
   0.6   character size randomizes from 60 to 100%.
   etc
   1     fixed size. 
   */
$CharacterSizeMode = 1;



/* Character rotation angle. The script will randomize the rotation of the
   characters between this angle in degrees, positive and negative. Set to
   zero for no rotation.  
   0  no rotation
   20 rotation of 20�
   */
$CharacterRotationMode = 20;

/*  Default font. You can change it. Font must be in same directory of script 
   */
$font = "./sans.ttf";


/*  Type of fonts used. Fonts must be in same directory of script 
   0 no random font. Default font is always loaded
   1 random fonts
   */
$randomfont = 0;
$fontlist = array ("sans.ttf","box.ttf","ball.ttf","shades.ttf","outlined.ttf","sp.ttf","dayplanner.ttf");


/* number and type of characters in the security code. 
   */
$Codelength = 6;
$Characters = "23456789abcdefghkmnpqrstuvwxyz";


/* Set image height  (width is automatically set) 
   */
$height = 60;


/* Set Backgroud color mode
    0 White
    1 Grey
    2 random shading background
   */
$BackgroudColorMode = 0;

# Don't change anything below here unless you know what you're doing

############################################################




// Create Securitycode
  for ($i = 0; $i < $Codelength; $i++) {
    $SecurityCode[$i] = substr($Characters,mt_rand(0,strlen($Characters) - 1),1);
    $pass=$pass.$SecurityCode[$i];
    $rand = mt_rand(0,1);
    If ($i == 1) {$rand = 1;}
    if ($rand > 0) 
    {$pass2=$pass2.$SecurityCode[$i]; 
     $select[$i] = $i;
     
     
    } 
    else
    { 
     $select[$i] = -1;
    }
    
    }

if ($randomfont > 0) {$font = $fontlist[mt_rand(0,6)];}



// Set  font size
$fontsize = $height * 0.6;	


// Set Width and Create image
$textbox2 = imagettfbbox($fontsize, 0, $font, $pass) or die('Error in imagettfbbox function');
$width = (abs($textbox2[4] - $textbox2[0]))*1.25;
$im = imagecreatetruecolor($width, $height);


// Create some colors
$white = imagecolorallocate($im, 255, 255, 255);
$grey = imagecolorallocate($im, 238, 238, 238);
$black = imagecolorallocate($im, 0, 0, 0);
$red = imagecolorallocate($im, 255, 0, 0);

// Create backgroud

ImageFill($im, 0, 0, $grey);

if ($BackgroudColorMode < 1) {ImageFill($im, 0, 0, $white);}

if ($BackgroudColorMode > 1) {

// colors to fade
$red_start   = mt_rand(0,255);
$red_end     = mt_rand($red_start,255);

$green_start = mt_rand(0,255);
$green_end   = mt_rand($green_start,255);

$blue_start  = mt_rand(0,255);
$blue_end    = mt_rand($blue_start,255);

function dif ($start,$end)
{
	if ($start >= $end)
		$dif = $start - $end;
	else
		$dif = $end - $start;

	return $dif;
}


function draw($start,$end,$pos,$step_width)
{
	if ($start > $end)	
		$color = $start - $step_width * $pos;
	else
		$color = $start + $step_width * $pos;
		
	return $color;
}	

$dif_red = dif($red_start,$red_end);
$dif_green = dif($green_start,$green_end);
$dif_blue = dif($blue_start,$blue_end);

$step_red = $dif_red / $width;
$step_green = $dif_green / $width;
$step_blue = $dif_blue / $width;

$height = $height-1;


for ($pos=0; $pos<=$width; $pos++)
{
	$color = ImageColorAllocate($im,draw($red_start,$red_end,$pos,$step_red),
						   			draw($green_start,$green_end,$pos,$step_green),
						   			draw($blue_start,$blue_end,$pos,$step_blue));	
	
	imageline($im,$pos,"0",$pos,$height,$color);
	
}


$height = $height+1;

}


/* generate colored thick random lines in background */

if ($LinearBackgroud > 0) {
		 imagesetthickness($im, $height/10);
		for( $i=0; $i<$width*$height/200; $i++ ) {
		$Color = imagecolorallocate($im, mt_rand(100,250), mt_rand(100,250), mt_rand(100,250));
   
			imageline($im, mt_rand(0,$width), mt_rand(0,$height), mt_rand(0,$width), mt_rand(0,$height), $Color);
		}
}


// staggering
$x = $width/18;
for ($i = 0; $i < $Codelength; $i++) {
 $Color = $black;
 if ($CharacterColorMode > 0)  $Color = imagecolorallocate($im, mt_rand(0,250), mt_rand(0,250), mt_rand(0,250));
 
 $textbox = imagettfbbox($fontsize, 0, $font, $SecurityCode[$i]) or die('Error in imagettfbbox function');
 $y = ($height - $textbox[5])/2;
 $w = abs($textbox[4] - $textbox[0]);
 
 $Size = mt_rand($fontsize*$CharacterSizeMode,$fontsize);
 $Angle = mt_rand(-$CharacterRotationMode,$CharacterRotationMode);
 if ($staggering > 0) { 
  $x = $x + rand($w-$w/18 , $w+$w/18);
 $y = rand($y-($height/6) ,$y+($height/6));  
 
 if ($subset < 1) {ImageTtfText($im,$Size,$Angle,$x-$w,$y,$Color,$font,$SecurityCode[$i]); } 
 else {
 
 if ($select[$i] > -1) {ImageTtfText($im,$Size,$Angle,$x-$w,$y,$red,$font,$SecurityCode[$i]); }
              else {ImageTtfText($im,$Size,$Angle,$x-$w,$y,$Color,$font,$SecurityCode[$i]);}
 
 }
 } 
 else {

 $y = $height - $height/4;
 $x = $x + $w*1.1;
  
 
 
 
if ($subset < 1) {ImageTtfText($im,$Size,$Angle,$x-$w,$y,$Color,$font,$SecurityCode[$i]); } 
 else {
 
 if ($select[$i] > -1) {ImageTtfText($im,$Size,$Angle,$x-$w,$y,$red,$font,$SecurityCode[$i]); }
              else {ImageTtfText($im,$Size,$Angle,$x-$w,$y,$Color,$font,$SecurityCode[$i]);}
 
 }
 
 }
}


//Vertical distortion amplitude and frequency, 
// good values $ampl_y = 5 $freq_y = 10; 0 for no vertical distorsion
$ampl_y = 5; 
$freq_y = 10;

//Horizontal distorsion amplitude and frequency, 
// good values $ampl_x = 5 $freq_x = 5; 0 for no vertical distorsion
$ampl_x = 5; 
$freq_x = 10; 


if ($distortion_ver > 0) {
//Apply vertical distortion
for ($i=0;$i<$width;$i+=2){
            imagecopy($im,$im,
                $xx+$i-2,$yy+sin($i/$freq_y)*$ampl_y,     //dest
                $xx+$i,$yy,             //src
                2,$height);
        }
 }  
if ($distortion_hor > 0) {      
//Apply horizontal distortion
for ($i=0;$i<$height;$i+=1){
            imagecopy($im,$im,
                $xx+sin($i/$freq_x)*$ampl_x,$yy+$i-1,     //dest
                $xx,$yy+$i,             //src
                $width,1);
        }
}


// Apply square noise
if ($SquareNoise > 0) {
imagesetthickness($im, 1);
for($i = 0; $i <= $width; $i += $height/5) {
        @ImageLine($im, $i, 0, $i, $height, $black);
      }
      for($i = 0; $i <= $height; $i += $height/5) {
        @ImageLine($im, 0, $i, $width, $i, $black);
      }
}



// Apply linear noise
if ($LinearNoise > 0) {
imagesetthickness($im, 1);
		for( $i=0; $i<$height; $i++ ) {
			imageline($im, mt_rand(0,$width), mt_rand(0,$height), mt_rand(0,$width), mt_rand(0,$height), $black);
		}
}

// Apply granular noise
if ($GranularNoise > 0) {
 for ($i=1;$i<($width*$width/10);$i++)
            {
                $cor_x = mt_rand(1,$width);
                $cor_y = mt_rand(1,$height);
                imagesetpixel($im,$cor_x,$cor_y,$black);
            }
}

// make image 
header('Content-Type: image/jpeg');
		imagejpeg($im);
		imagedestroy($im);

//store code to verify

if ($subset > 0) {$pass = $pass2;}


@session_start();
$_SESSION['code'] = $pass;


?> 

