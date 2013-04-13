;(function($) {

    function createTitlePreview() {
        var title = $("#title");
        var previewTitle = $('.preview h3');
        title.keyup(function() {
            previewTitle.text(title.attr('value'));
        });
    }

    function createIngredientPreview() {
        var quantity = $('#quantity');
        var name = $('#name');
        var li = $('.preview ul li:last');
        var quantityPreview = $('#quantity-preview');
        var namePreview = $('#name-preview');

        quantity.keyup(function() {
            quantityPreview.text(quantity.attr('value'));
        })

        name.keyup(function() {
            namePreview.text(name.attr('value'));
        })
    }

    function clearFieldsAndPreview() {
        $('#quantity-preview').text('');
        $('#name-preview').text('');
        $('#quantity').attr('value', '').focus();
        $('#name').attr('value', '');
    }

    function addIngredient() {
        var ul = $('.preview ul:first');
        var quantityPreview = $('#quantity-preview');
        var namePreview = $('#name-preview');

        var html = '<li><a href="#" class="delete">Delete</a><span class="quantity">' + quantityPreview.text() + '</span> <span class="name">' + namePreview.text() + '</span></li>';

        $('#preview-li').before(html);

        ul.find('.delete').click(function(e) {
            e.preventDefault();
            $(this).parent('li').hide().remove();
        })

        clearFieldsAndPreview();
        createIngredientPreview();
    }

    function constructSandwichCreateRequestJSON() {
        var req = {};
        req.sandwich = {};

        req.sandwich.title = $('.preview h3:first').text();
        req.sandwich.price = 150;
        req.sandwich.ingredients_attributes = [];

        $(".preview ul li").not('#preview-li').each(function() {
            var ingredient = {};
            ingredient.quantity = $(this).find(".quantity").text();
            ingredient.name = $(this).find(".name").text();

            req.sandwich.ingredients_attributes.push(ingredient);
        });
        var output = JSON.stringify(req);
        console.log(output.toString());
        return output;
    }

    $(document).ready(function() {
        createTitlePreview();
        createIngredientPreview();

        $('#add-ingredient').click(function() {
            addIngredient();
            constructSandwichCreateRequestJSON();
        });

        $('#save-sandwich').click(function(e) {
            e.preventDefault();
            var data={};
            data.sandwich = constructSandwichCreateRequestJSON();

            $.post('/send-sandwich', data, function(response, status) {
                if (response == '') {
                    alert('Some errors prevented your sandwich from being saved ... try again');
                } else {
                    alert('YAY! your sandwich was saved!!!');
                    window.location = '/';
                }
            });
        })
    });

})(jQuery);
