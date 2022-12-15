<head>
    <title>WikiChain</title>
    <link href="bootstrap-3.4.1-dist/bootstrap-3.4.1-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap-3.4.1-dist/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <meta charset="utf-8">
</head>

<header class="py-3 mb-4 border-bottom">
    <div class="container d-flex flex-wrap justify-content-center">
        <a href="index.html" class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto text-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
            <span class="fs-4">WikiChain</span>
        </a>
        <form action="voirSujet.html" method="get" class="col-12 col-lg-auto mb-3 mb-lg-0">
            <input type="search" class="form-control" id="name" name="name" placeholder="Search..." aria-label="Search">
        </form>
    </div>
</header>


<div class="py-3 mb-4 border-bottom">

    <h1 style="text-align: center">
        <?php
        
        $name = $_GET['name'];

        $output = file_get_contents("articles/$name.json");
        $myArray = json_decode($output, true);
        echo $myArray['name'];
        
        if($output == null){echo $name;}
        ?>
    </h1>

    <p>
	<?php 
    
        $output = file_get_contents("articles/$name.json");
        $myArray = json_decode($output, true);
        echo $myArray['content'];

        // if result of exec is null then the topic doesn't exist
        if($output == null){
            echo "Cette page n'existe pas, cependant vous pouvez la créer avec le lien ci dessous 
            <br>";

            echo "<a href='ajouterSujet.html'>Créer la page</a>";
        }

	?>
    </p>

</div>
