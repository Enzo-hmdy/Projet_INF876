
<?php 

$name = $_GET['name'];
$content= $_GET['content'];
$author = $_GET['author'];
$theme = $_GET['theme'];


exec("./'Script enzo'/publish.sh $title $content $author $theme");
header("Location: voirSujet.php?title=$title");
?>

