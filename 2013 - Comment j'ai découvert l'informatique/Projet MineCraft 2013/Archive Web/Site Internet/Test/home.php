<!DOCTYPE html>
<html lang="fr">
<head>
<title>MineCryms</title>
<!-- On ouvre la fenêtre à la largeur de l'écran -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Intégration du CSS Bootstrap -->
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" media="screen"> 
</head>
<body>
<!-- Conteneur principal -->
<div class="container"></div>
<!-- Intégration de la libraire jQuery -->
<script src="bootstrap/js/jquery.js"></script>
<!-- Intégration de la libraire de composants du Bootstrap -->
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
</script>
<div class="margin-mobile hidden-tablet hidden-desktop"></div>
<div class="navbar navbar-fixed-top"> <!-- délimite la navbar; navbar-fixed-top fixe le tout en haut de page huhu -->
  <div class="navbar-inner">
    <div class="container"> <!-- délimite la largeur de la page -->
      <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <!-- Utile pour les mobiles. Voir explication si dessous -->
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
      <a class="brand" href="">MineCryms</a> <!-- le logo, nom de votre projet -->
      <div class="nav-collapse"> <!-- La zone de menu rétractable pour les mobiles -->
        <ul class="nav"> <!-- La dite zone de menu -->
          <li class="active"><a href="#">Accueil</a></li>
          <li><a href="minecraft.php">MineCraft</a></li>
          <li><a href="cubeworld.php">CubeWorld</a></li>
          <li><a href="download.php">Telechargements</a></li>
		  <li><a href="sites.php">Sites de Referencements</a></li>
		  </ul>
		  </br>
         </div><!-- /.nav-collapse -->
       </div>
     </div><!-- /navbar-inner -->
    </div>
<div id="this-carousel-id" class="carousel slide"><!-- class of slide for animation -->
  <div class="carousel-inner">
    <div class="item active"><!-- class of active since it's the first item -->
      <img src="http://ticraft.fr/temp/img/carousel/slide1.jpg" alt="" />
      <div class="carousel-caption">
        <p>Description !</p>
      </div>
    </div>
    <div class="item">
      <img src="http://ticraft.fr/temp/img/carousel/slide2.png" alt="" />
      <div class="carousel-caption">
        <p>Description !</p>
      </div>
    </div>
    <div class="item">
      <img src="http://ticraft.fr/temp/img/carousel/slide3.png" alt="" />
      <div class="carousel-caption">
        <p>Description !</p>
      </div>
    </div>
    <div class="item">
      <img src="http://ticraft.fr/temp/img/carousel/slide4.png" alt="" />
      <div class="carousel-caption">
        <p>Description !</p>
      </div>
    </div>
  </div><!-- /.carousel-inner -->
  <!--  Next and Previous controls below
        href values must reference the id for this carousel -->
    <a class="carousel-control left" href="#this-carousel-id" data-slide="prev">&lsaquo;</a>
    <a class="carousel-control right" href="#this-carousel-id" data-slide="next">&rsaquo;</a>
</div><!-- /.carousel -->



	<div class="container-fluid">
<body background="images\bg.png">
	</br>
<div class="row-fluid">
<div class="hero-unit">
	<h1>MineCryms</h1><br>
	<h2>La Platforme Multi-Gaming!</h2>
  </br> </br>
  </div>
  <div class="row-fluid">
  <div class="span8"><div class="hero-unit"><h1>News :</h1><h2>Nous sommes sur Serveur Minecraft.org</h2><a href="http://www.serveurs-minecraft.org/vote.php?id=26424" target="_blank"> <input class="btn btn-primary" type="button" value="Voter Pour MineCryms"></a></a> sur le top <a href="http://www.serveurs-minecraft.org/">Serveur Minecraft</a></div>
</div>


<div class="modal hide fade" id="infos">
  <div class="modal-header"> <a class="close" data-dismiss="modal">×</a>
    <h3>Plus d'informations</h3>
  </div>
  <div class="modal-body">
  </div>
  <div class="modal-footer"> <a class="btn btn-info" data-dismiss="modal">Fermer</a> </div>
</div>
<a class="btn btn-primary" data-toggle="modal" href="tuto02_01.html" data-target="#infos">Plus d'informations</a>
  
