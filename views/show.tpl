<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Hello Sandwiches | {{sandwich['title']}}</title>
        <link rel="stylesheet" href="/static/master.css" />
    </head>
    <body>
        <div class="container">
            <header class="branding">
                <h1 class="logo">Hello Sandwiches</h1>
                <nav>
                    <a href="/build/" class="add">Build your sandwich</a>
                    <a href="/" class="back">All sandwiches</a>
                </nav>
            </header>

            <div class="colwrap">
                <div class="sandwich" itemscope itemtype="http://schema.org/Recipe">
                    <h3 itemprop="name">{{sandwich['title']}}</h3>
                    <ul>
                        %for ingredient in sandwich['ingredients']:
                            <li itemprop="ingredients">
                                {{ingredient['quantity']}} {{ingredient['name']}}
                            </li>
                        %end
                    </ul>
                </div>

                <a href="/" class="back">Back to all sandwiches</a>
            </div>
        </div>
    </body>
</html>

