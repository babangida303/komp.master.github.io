<?php
	// главная страница
	header('Content-type: text/html; charset=utf-8');
	include 'auth.php';
	include 'func.php';
	include 'scripts.php';
	$con=connect();
	$title='Рейтинг';
	$table='reviews';
	if (!in_array($_SESSION['level'], array(10, 5, 1))) { // доступ разрешен только группе пользователей
		header("Location: login.php"); // остальных просим залогиниться
		exit;
	};
?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
    <title><?php echo $title;?></title>
</head>
<body>
    <div class="banner">
        <h1><?php echo $title;?></h1>
    </div>
    <div class="content">
<?php
	include('menu.php');
?>

				<div class="main-content">

<?php
	$query="
		SELECT services.name AS 'Наименование филиала', t.rating_avg AS 'Рейтинг'
		FROM services
		LEFT JOIN (
			SELECT *, AVG(rating) as rating_avg FROM `reviews`
			WHERE 1
			GROUP BY service_id
			) AS t ON services.id=t.service_id
		ORDER BY t.rating_avg DESC
	";
	echo SQLResultTable($query, $con, '');
?>


        </div>
    </div>
<?php
	include('footer.php');
?>
</body>
</html>
