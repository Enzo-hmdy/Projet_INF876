<head>
    <title>WikiChain</title>
    <link href="bootstrap-3.4.1-dist/bootstrap-3.4.1-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap-3.4.1-dist/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <meta charset="utf-8">
</head>

<header class="row" style="margin: 30px;">
  <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
    <a href="index.html" type="button" class="btn btn-success btn-lg">
      <span class="fs-4">WikiChain</span>
    </a>
  </div>
  
  <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
    
  </div>
  
  <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="padding:20px">
    <form action="voirSujet.php" method="get" class="col-12 col-lg-auto mb-3 mb-lg-0">
      <input type="search" class="form-control" id="name" name="name" placeholder="Search..." aria-label="Search">
    </form>
  </div>
</header>


<div class="row">
    
    
    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
        
    </div>
    

    <div class="col-md-8">

        <h1 style="text-align: center">
            <?php
            
            $name = $_GET['name'];

            $output = file_get_contents("articles/$name.json");
            $myArray = json_decode($output, true);
            echo $myArray['name'];
            
            if($output == null){echo $name;}
            ?>
            <hr>
        </h1>

        <h3>
        <?php 
        
            $output = file_get_contents("articles/$name.json");
            $myArray = json_decode($output, true);
            echo $myArray['content'];

            // if result of exec is null then the topic doesn't exist
            if($output == null){
                echo "<h3 style='text-align: center'>
                Cette page n'existe pas, cependant vous pouvez la créer avec le lien ci dessous 
                <br>";

                echo "<a href='ajouterSujet.html' type='button' style='margin:10px' class='btn btn-success btn-lg'>
                <span class='fs-4'>Ajouter un sujet</span>
              </a>
              </h3>";
            }

        ?>
        </h3>

    </div>

    
    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
        
    </div>
    

</div>
