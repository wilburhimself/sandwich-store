<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Hello Sandwiches | Home</title>
        <link rel="stylesheet" href="/static/master.css" />
    </head>
    <body>
        <div class="container">
            <header class="branding">
                <h1 class="logo">Hello Sandwiches</h1>
                <nav>
                    <a href="/build/" class="add">Build your sandwich</a>
                </nav>
            </header>
            <div class="colwrap">
                <ul class="sandwiches">
                    %for sandwich in sandwiches:
                        <li><a href="/sandwich/{{sandwich['id']}}">{{sandwich['title']}}</a></li>
                    %end
                </ul>
            </div>
        </div>
    </body>
</html>
