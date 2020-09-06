<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<title>欢迎来到team01的主页</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</head>
<body>

<nav class="navbar navbar-light bg-light ">
			
			<a class="navbar-brand">Welcome to homepage</a>
				<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
				<form action="<%=request.getContextPath() %>/log_out"  method="post">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Log out</button>
				</form>
			
		</nav>
	<div class="container">
	<ul class="nav justify-content-center py-1 mb-2">
		<li class="nav-item">
			<a class="nav-link active" href="#">World</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">U.S.</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">Technology</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">Design</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">Culture</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">Business</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">Polities</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">Opinion</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">Design</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">Science</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">Health</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">Style</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">Travel</a>
		</li>
	</ul>

	<div class="jumbotron p-3 p-md-5 text-white rounded bg-dark">
		<div class="lead text-white font-weight-bold">
			<h1 class="display-4" id="d4_title">Hello, world!</h1>
			<p class="lead" id="d4_text">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
			<hr class="my-4" >
			<p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
			<a class="btn btn-primary btn-lg" href="#" role="button" id="d4_url">Learn more</a>
		</div>
	</div>
	
	<div class="row mb-4">
		<div class="col-sm-6">
			<div class="card" id="card-1">
				<div class="row" >
					<div class="col-md-8">
						<div class="card-body">
							<strong class="d-inline-block mb-2 text-primary">Category</strong>
							<h5 class="card-title mb-0"><a class="text-dark" href="#">Card title</a></h5>
							<p class="card-text mb-1"><small class="text-muted">Date</small></p>
							<p class="short-text">Some quick example text to build on the card title and make up the
								bulk of the card's content.</p>
							<p class="mb-1"><a href="#">Continue reading</a></p>
						</div>
					</div>
					<div class="col-md-4 img-center">
						<img class="card-img" alt="placeholder" />
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="card" id="card-2">
				<div class="row" >
					<div class="col-md-8">
						<div class="card-body">
							<strong class="d-inline-block mb-2 text-primary">Category</strong>
							<h5 class="card-title mb-0"><a class="text-dark" href="#">Card title</a></h5>
							<p class="card-text mb-1"><small class="text-muted">Date</small></p>
							<p class="short-text">Some quick example text to build on the card title and make up the
								bulk of the card's content.</p>
							<p class="mb-1"><a href="#">Continue reading</a></p>
						</div>
					</div>
					<div class="col-md-4 img-center">
						<img class="card-img" alt="placeholder" />
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="row">
		<div class="col-md-8 ">
			<h3 class="pb-3 mb-4 border-bottom">Latest Updates</h3>
			<div id="latest-news-1">
				<h2>Title</h2>
				<p>
					<small class="text-muted"><span class="date">Date</span> by <a href="#"
							class="author">Author</a></small>
				</p>
				<p class="short-text">short text</p>
				<hr />
				<p class="body">body</p>
			</div>
			<div id="latest-news-2">
				<h2>Title</h2>
				<p>
					<small class="text-muted"><span class="date">Date</span> by <a href="#"
							class="author">Author</a></small>
				</p>
				<p class="short-text">short text</p>
				<hr />
				<p class="body">body</p>
			</div>
		</div>
		<div class="col-md-4">
			<div class="jumbotron p-3 bg-light">
				<h4>About</h4>
				<p>This is a quick overview of Lighthouse Plan Flask Project. The frontend design is refering to
					this <a href="https://getbootstrap.com/docs/4.0/examples/blog/">template</a>.</p>
			</div>
		</div>
	</div>


</body>
</html>
