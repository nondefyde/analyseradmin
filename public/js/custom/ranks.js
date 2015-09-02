/**
 * Created by Cecilee2 on 8/4/2015.
 */

$(function () {
    $('.add_rank').click(function (e) {
        e.preventDefault();
        var clone_row = $('#rank_table tbody tr:last-child').clone();

        $('#rank_table tbody').append(clone_row);

        clone_row.children(':nth-child(1)').html(parseInt(clone_row.children(':nth-child(1)').html()) + 1);
        clone_row.children(':nth-child(2)').children('input').val('');
        clone_row.children(':nth-child(2)').children('input[type=hidden]').val(-1);
        clone_row.children(':nth-child(3)').children('select').val('');
        clone_row.children(':last-child').html('<button class="btn btn-danger btn-rounded btn-condensed btn-sm remove_rank"><span class="fa fa-times"></span> Remove</button>');
    });

    $(document.body).on('click', '.remove_rank', function () {
        $(this).parent().parent().remove();
    });

    $(document.body).on('click', '.delete_rank', function (e) {
        e.preventDefault();
        var box = $("#confirm-remove-row");

        var parent = $(this).parent().parent();
        var rank = parent.children(':nth-child(2)').children('input').val();
        var rank_id = parent.children(':nth-child(2)').children('input[type=hidden]').val();
        var user_type = parent.children(':nth-child(3)').children('select').children('option:selected').text();

        $("#rank_value").text('Rank ' + rank + ' From ' + user_type);
        $("#confirm_rank_delete").val(rank_id);
        box.addClass("open");
    });

    $(document.body).on('click', '#confirm_rank_delete', function (e) {
        //e.preventDefault();
        var box = $("#confirm-remove-row");
        var rank_id = $(this).val();
        $.ajax({
            type: 'GET',
            async: true,
            url: '/ranks/delete/' + rank_id,
            success: function (data, textStatus) {
                box.removeClass("open");
                window.location.replace('/ranks');
                //location.reload();
            },
            error: function (xhr, textStatus, error) {
                alert(textStatus + ' ' + xhr);
            }
        });
        return false;
    });
});




