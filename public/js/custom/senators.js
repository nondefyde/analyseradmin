/**
 * Created by Cecilee2 on 8/4/2015.
 */

$(function () {
    $('.add_senator').click(function (e) {
        e.preventDefault();
        var clone_row = $('#senator_table tbody tr:last-child').clone();

        $('#senator_table tbody').append(clone_row);

        clone_row.children(':nth-child(1)').html(parseInt(clone_row.children(':nth-child(1)').html()) + 1);
        clone_row.children(':nth-child(2)').children('select').val('');
        clone_row.children(':nth-child(2)').children('input[type=hidden]').val(-1);
        clone_row.children(':nth-child(3)').children('select').val('');
        clone_row.children(':nth-child(4)').children('select').val('');
        clone_row.children(':nth-child(5)').children('select').val('');
        clone_row.children(':nth-child(6)').children('select').val('');
        clone_row.children(':last-child').html('<button class="btn btn-danger btn-rounded btn-condensed btn-sm remove_senator"><span class="fa fa-times"></span> Remove</button>');
    });

    $(document.body).on('click', '.remove_senator', function () {
        $(this).parent().parent().remove();
    });

    $(document.body).on('click', '.delete_senator', function (e) {
        e.preventDefault();
        var box = $("#confirm-remove-row");

        var parent = $(this).parent().parent();
        console.log(parent);
        var senator = parent.children(':nth-child(2)').children('select').children('option:selected').text();
        var senator_id = parent.children(':nth-child(2)').children('input[type=hidden]').val();
        var user_type = parent.children(':nth-child(4)').children('select').children('option:selected').text();

        $("#senator_value").text('Senator ' + senator + ' From ' + user_type);
        $("#confirm_senator_delete").val(senator_id);
        box.addClass("open");
    });

    $(document.body).on('click', '#confirm_senator_delete', function (e) {
        //e.preventDefault();
        var box = $("#confirm-remove-row");
        var senator_id = $(this).val();
        $.ajax({
            type: 'GET',
            async: true,
            url: '/senators/delete/' + senator_id,
            success: function (data, textStatus) {
                box.removeClass("open");
                //window.location.replace('/senators');
                location.reload();
            },
            error: function (xhr, textStatus, error) {
                alert(textStatus + ' ' + xhr);
            }
        });
        return false;
    });

    // Ajax Get Senatorial Districts Based on the state
    $(document.body).on('change', '.state_options', function (e) {
        var district = $(this).parent().parent().children(':nth-child(4)').children('select');
        if($(this).val() == ''){
            district.val('');
            district.text('');
        }else {
            $.ajax({
                type: "get",
                async: true,
                //data:parent.serialize(),
                url: '/list-box/districts/' + $(this).val(),
                dataType: "html",
                success: function (data, textStatus) {
                    district.html(data);
                }
            });
        }
        return false;
    });
});




