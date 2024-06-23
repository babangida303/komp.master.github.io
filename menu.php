<?php
	$menu= '
<div class="menu">
	<ul>
		<li> <a href="index.php">Главная</a> </li>';
	// меню по уровням доступа: 10 - админ и т.д.
	if ( !empty($_SESSION['level']) && in_array($_SESSION['level'], array(10)) ) $menu.='<li> <a href="news.php">Новости</a> </li>';
	if ( !empty($_SESSION['level']) && in_array($_SESSION['level'], array(10)) ) $menu.='<li> <a href="levels.php">Уровни доступа</a> </li>';
	if ( !empty($_SESSION['level']) && in_array($_SESSION['level'], array(10)) ) $menu.='<li> <a href="users.php">Пользователи</a> </li>';
	if ( !empty($_SESSION['level']) && in_array($_SESSION['level'], array(10, 5, 1)) ) $menu.='<li> <a href="statuses.php">Статусы</a> </li>';
	if ( !empty($_SESSION['level']) && in_array($_SESSION['level'], array(10, 5, 1)) ) $menu.='<li> <a href="repairs.php">Типы ремонта</a> </li>';
	if ( !empty($_SESSION['level']) && in_array($_SESSION['level'], array(10, 5, 1)) ) $menu.='<li> <a href="services.php">Филиалы</a> </li>';
	if ( !empty($_SESSION['level']) && in_array($_SESSION['level'], array(10, 5, 1)) ) $menu.='<li> <a href="visits.php">Визиты, брони, ремонты</a> </li>';
	if ( !empty($_SESSION['level']) && in_array($_SESSION['level'], array(10, 5, 1)) ) $menu.='<li> <a href="reviews.php">Отзывы</a> </li>';
	if ( !empty($_SESSION['level']) && in_array($_SESSION['level'], array(10, 5, 1)) ) $menu.='<li> <a href="rating.php">Рейтинг филиалов</a> </li>';
	if ( !empty($_SESSION['level'])) $menu.='<li> <a href="?do=exit">Выход</a> </li>';
	$menu.='
	</ul>
</div>';
	echo $menu;
?>