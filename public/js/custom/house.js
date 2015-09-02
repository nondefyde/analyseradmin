/**
 * Created by Cecilee2 on 8/4/2015.
 */

$(function () {
    $('.add_house').click(function (e) {
        e.preventDefault();
        var clone_row = $('#house_table tbody tr:last-child').clone();

        $('#house_table tbody').append(clone_row);

        clone_row.children(':nth-child(1)').html(parseInt(clone_row.children(':nth-child(1)').html()) + 1);
        clone_row.children(':nth-child(2)').children('input').val('');
        clone_row.children(':nth-child(2)').children('input[type=hidden]').val(-1);
        clone_row.children(':nth-child(3)').children('select').val('');
        clone_row.children(':last-child').html('<button class="btn btn-danger btn-rounded btn-condensed btn-sm remove_house"><span class="fa fa-times"></span> Remove</button>');
    });

    $(document.body).on('click', '.remove_house', function () {
        $(this).parent().parent().remove();
    });

    $(document.body).on('click', '.delete_house', function (e) {
        e.preventDefault();
        var box = $("#confirm-remove-row");

        var parent = $(this).parent().parent();
        console.log(parent);
        var house = parent.children(':nth-child(2)').children('input').val();
        var house_id = parent.children(':nth-child(2)').children('input[type=hidden]').val();
        var user_type = parent.children(':nth-child(3)').children('select').children('option:selected').text();

        $("#house_value").text('House ' + house + ' From ' + user_type);
        $("#confirm_house_delete").val(house_id);
        box.addClass("open");
    });

    $(document.body).on('click', '#confirm_house_delete', function (e) {
        //e.preventDefault();
        var box = $("#confirm-remove-row");
        var rank_id = $(this).val();
        $.ajax({
            type: 'GET',
            async: true,
            url: '/houses/delete/' + rank_id,
            success: function (data, textStatus) {
                box.removeClass("open");
                window.location.replace('/houses');
                //location.reload();
            },
            error: function (xhr, textStatus, error) {
                alert(textStatus + ' ' + xhr);
            }
        });
        return false;
    });
});




