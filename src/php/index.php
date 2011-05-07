<?php

require_once('twitteroauth/twitteroauth.php');



$consumer_key = "YOUR CONSUMER KEY";
$consumer_secret = "YOUR CONSUMER SECRET";
$access_token = "YOUR ACCESS TOKEN";
$access_token_secret = "YOU ACCESS TOKEN SECRET";



/* Create a TwitterOauth object with consumer/user tokens. */
$connection = new TwitterOAuth($consumer_key,$consumer_secret,$access_token,$access_token_secret);


/*for kokkkuri function */

require_once("./kokkuri_func.php");

if (isset($_GET["kokkuri"]) && $_GET["kokkuri"] != "") {
$buf = rand( 0, 10);

$moji = $_GET["kokkuri"];

$moji = convert($moji);

$kokkuri = "　";

for ($i = 0 ; $i < $buf ; $i++) {
  $kokkuri .= "　";
}

$kokkuri .= $moji;

echo $moji;
echo $kokkuri;


$connection->post('statuses/update', array('status' => $kokkuri));
}


?>
<br /><br />checkout <a href="http://twitter.com/#!/kokkuri_san2010">@kokkuri_san2010</a>
