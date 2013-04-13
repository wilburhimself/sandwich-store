<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Hello Sandwiches | Build your sandwish</title>
        <link rel="stylesheet" href="/static/master.css" />
    </head>
    <body>
        <div class="container">
            <header class="branding">
                <h1 class="logo">Hello Sandwiches</h1>
                <nav>
                    <a href="/" class="back">All sandwiches</a>
                </nav>
            </header>

            <div class="colwrap">
                <div class="form">
                    <p>
                        <label>Sandwich Title</label>
                        <input id="title" />
                    </p>
                    <hr />
                    <h4>Ingredients</h4>
                    <div class="ingredients">
                        <p>
                            <input class="quantity" id="quantity" />
                            <input class="name" id="name" />
                        <p>
                        <button id="add-ingredient">Add another ingredient</button>
                    </div>
                </div>


                <div class="preview sandwich">
                    <h3></h3>
                    <ul><li id="preview-li"><span id="quantity-preview" class="quantity"></span> <span id="name-preview" class="name"></span></li></ul>
                </div>

                <a href="/construct" class="build-it" id="save-sandwich">Ready, let's Go!</a>
            </div>

        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
        <script src="/static/builder.js"></script>
    </body>
</html>
