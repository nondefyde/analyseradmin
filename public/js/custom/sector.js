/**
 * Created by Cecilee2 on 8/4/2015.
 */

$(function () {
    $('.add_sector').click(function(e){
        e.preventDefault();
        var clone_row = $('#menu_table tbody tr:last-child').clone();

        $('#menu_table tbody').append(clone_row);

        clone_row.children(':nth-child(1)').html( parseInt(clone_row.children(':nth-child(1)').html())+1);
        clone_row.children(':nth-child(2)').children('input').val('');
        clone_row.children(':nth-child(2)').children('input[type=hidden]').val(-1);
        clone_row.children(':last-child').html('<button class="btn btn-danger btn-rounded btn-condensed btn-sm remove_sector"><span class="fa fa-times"></span> Remove</button>');
    });

    $(document.body).on('click','.remove_sector',function(){
        $(this).parent().parent().remove();
    });

    $(document.body).on('click', '.delete_sector',function(e){
        e.preventDefault();
        var box = $("#confirm-remove-row");

        var parent = $(this).parent().parent();
        var sector = parent.children(':nth-child(2)').children('input').val();
        var sector_id = parent.children(':nth-child(2)').children('input[type=hidden]').val();

        $("#menu_value").text('Sector '+sector);
        $("#confirm_sector_delete").val(sector_id);
        box.addClass("open");
    });
    $(document.body).on('click', '#confirm_sector_delete',function(e){
        //e.preventDefault();
        var box = $("#confirm-remove-row");
        var sector_id = $(this).val();
        $.ajax({
            type: 'GET',
            async: true,
            url: '/sectors/delete/' + sector_id,
            success: function(data,textStatus){
                box.removeClass("open");
                window.location.replace('/sectors');
            },
            error: function(xhr,textStatus,error){
                alert(textStatus + ' ' + xhr);
            }
        });
        return false;
    });

});




