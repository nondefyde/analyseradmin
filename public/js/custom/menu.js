/**
 * Created by Cecilee2 on 8/4/2015.
 */

$(function () {
    $('.add_menu').click(function(e){
        e.preventDefault();
        var clone_row = $('#menu_table tbody tr:last-child').clone();

        $('#menu_table tbody').append(clone_row);

        clone_row.children(':nth-child(1)').html( parseInt(clone_row.children(':nth-child(1)').html())+1);
        clone_row.children(':nth-child(2)').children('input').val('');
        clone_row.children(':nth-child(2)').children('input[type=hidden]').val(-1);
        clone_row.children(':nth-child(3)').children('input').val('');
        clone_row.children(':nth-child(4)').children('div.input-group').children('input').val('');
        clone_row.children(':nth-child(4)').children('div.input-group').children('span').html('');
        clone_row.children(':nth-child(5)').children('select').val('');
        clone_row.children(':nth-child(6)').children('input').val('');
        clone_row.children(':last-child').html('<button class="btn btn-danger btn-rounded btn-condensed btn-sm remove_menu"><span class="fa fa-times"></span> Remove</button>');
    });

    $(document.body).on('click','.remove_menu',function(){
        $(this).parent().parent().remove();
    });

    $(document.body).on('click', '.delete_menu',function(e){
        e.preventDefault();
        var box = $("#confirm-remove-row");

        var parent = $(this).parent().parent();
        var menu = parent.children(':nth-child(2)').children('input').val();
        var menu_id = parent.children(':nth-child(2)').children('input[type=hidden]').val();

        $("#menu_value").text('Menu '+menu);
        $("#confirm_menu_delete").val(menu_id);
        box.addClass("open");
    });
    $(document.body).on('click', '#confirm_menu_delete',function(e){
        //e.preventDefault();
        var box = $("#confirm-remove-row");
        var menu_id = $(this).val();
        $.ajax({
            type: 'GET',
            async: true,
            url: '/menus/delete/' + menu_id,
            success: function(data,textStatus){
                box.removeClass("open");
                window.location.replace('/menus');
            },
            error: function(xhr,textStatus,error){
                alert(textStatus + ' ' + xhr);
            }
        });
        return false;
    });

});




