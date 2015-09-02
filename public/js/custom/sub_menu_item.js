/**
 * Created by Cecilee2 on 8/4/2015.
 */

$(function () {
    $('.add_sub_menu_item').click(function(e){
        e.preventDefault();
        var clone_row = $('#sub_sub_menu_item_table tbody tr:last-child').clone();

        $('#sub_sub_menu_item_table tbody').append(clone_row);

        clone_row.children(':nth-child(1)').html( parseInt(clone_row.children(':nth-child(1)').html())+1);
        clone_row.children(':nth-child(2)').children('input').val('');
        clone_row.children(':nth-child(2)').children('input[type=hidden]').val(-1);
        clone_row.children(':nth-child(3)').children('input').val('');
        clone_row.children(':nth-child(4)').children('div.input-group').children('input').val('');
        clone_row.children(':nth-child(4)').children('div.input-group').children('span').html('');
        clone_row.children(':nth-child(5)').children('select').val('');
        clone_row.children(':nth-child(6)').children('select').val('');
        clone_row.children(':nth-child(7)').children('input').val('');
        clone_row.children(':last-child').html('<button class="btn btn-danger btn-rounded btn-condensed btn-sm remove_sub_menu_item"><span class="fa fa-times"></span> Remove</button>');
    });

    $(document.body).on('click','.remove_sub_menu_item',function(){
        $(this).parent().parent().remove();
    });

    $(document.body).on('click', '.delete_sub_menu_item',function(e){
        e.preventDefault();
        var box = $("#confirm-remove-row");

        var parent = $(this).parent().parent();
        console.log(parent);
        var sub_menu_item = parent.children(':nth-child(2)').children('input').val();
        var sub_menu_item_id = parent.children(':nth-child(2)').children('input[type=hidden]').val();
        var menu_item = parent.children(':nth-child(5)').children('select').children('option:selected').text();

        $("#sub_menu_item_value").text('Sub Menu Item '+sub_menu_item+' From '+menu_item);
        $("#confirm_sub_menu_item_delete").val(sub_menu_item_id);
        box.addClass("open");
    });

    $(document.body).on('click', '#confirm_sub_menu_item_delete',function(e){
        //e.preventDefault();
        var box = $("#confirm-remove-row");
        var menu_item_id = $(this).val();
        $.ajax({
            type: 'GET',
            async: true,
            url: '/sub-menu-items/delete/' + menu_item_id,
            success: function(data,textStatus){
                box.removeClass("open");
                window.location.replace('/sub-menu-items');
                //location.reload();
            },
            error: function(xhr,textStatus,error){
                alert(textStatus + ' ' + xhr);
            }
        });
        return false;
    });
});




