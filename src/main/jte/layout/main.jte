@import gg.jte.Content

@param Content content
@param String title

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${title}</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.3.3/dist/cerulean/bootstrap.min.css" integrity="sha256-qR01fmz4XOCNC3dVfO+qjS6hX2BbJjqGD8WGd5sG19o=" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body class="container">
<nav
        class="navbar navbar-expand-lg bg-primary"
>
    <div class="container-fluid">
        <img src="dolphin128x128.png" alt="Bootstrap" width="30" height="24" />
        <a class="navbar-brand text-white" href="/">Dolphins Swim Academy</a>
        <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation"
        >
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active text-white" aria-current="page" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/classes">Classes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/students">Students</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="#">Coaches</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

${content}

<footer class="text-center bg-body-tertiary text-secondary-emphasis">
    <p>Copyright &copy Dolphins Swim Academy 2024
        <br>
        Dolphin icon is created by <a href="https://www.flaticon.com/authors/freepik">Freepik</a> from <a href="https://www.flaticon.com/,">Flaticon</a></p>
</footer>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"
></script>
</body>
</html>