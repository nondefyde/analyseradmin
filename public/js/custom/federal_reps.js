/**
 * Created by Cecilee2 on 8/4/2015.
 */

$(function () {
    $('.add_federal_reps').click(function (e) {
        e.preventDefault();
        var clone_row = $('#federal_reps_table tbody tr:last-child').clone();

        $('#federal_reps_table tbody').append(clone_row);

        clone_row.children(':nth-child(1)').html(parseInt(clone_row.children(':nth-child(1)').html()) + 1);
        clone_row.children(':nth-child(2)').children('select').val('');
        clone_row.children(':nth-child(2)').children('input[type=hidden]').val(-1);
        clone_row.children(':nth-child(3)').children('select').val('');
        clone_row.children(':nth-child(4)').children('select').val('');
        clone_row.children(':nth-child(5)').children('select').val('');
        clone_row.children(':nth-child(6)').children('select').val('');
        clone_row.children(':last-child').html('<button class="btn btn-danger btn-rounded btn-condensed btn-sm remove_federal_reps"><span class="fa fa-times"></span> Remove</button>');
    });

    $(document.body).on('click', '.remove_federal_reps', function () {
        $(this).parent().parent().remove();
    });

    $(document.body).on('click', '.delete_federal_reps', function (e) {
        e.preventDefault();
        var box = $("#confirm-remove-row");

        var parent = $(this).parent().parent();
        console.log(parent);
        var federal_reps = parent.children(':nth-child(2)').children('select').children('option:selected').text();
        var federal_reps_id = parent.children(':nth-child(2)').children('input[type=hidden]').val();
        var user_type = parent.children(':nth-child(4)').children('select').children('option:selected').text();

        $("#federal_reps_value").text(federal_reps + ' From ' + user_type + ' Federal Constituency');
        $("#confirm_federal_reps_delete").val(federal_reps_id);
        box.addClass("open");
    });

    $(document.body).on('click', '#confirm_federal_reps_delete', function (e) {
        //e.preventDefault();
        var box = $("#confirm-remove-row");
        var federal_reps_id = $(this).val();
        $.ajax({
            type: 'GET',
            async: true,
            url: '/federal-reps/delete/' + federal_reps_id,
            success: function (data, textStatus) {
                box.removeClass("open");
                location.reload();
            },
            error: function (xhr, textStatus, error) {
                alert(textStatus + ' ' + xhr);
            }
        });
        return false;
    });

    // Ajax Get Federal Constituencies Based on the state
    $(document.body).on('change', '.state_options', function (e) {
        var federal = $(this).parent().parent().children(':nth-child(4)').children('select');
        if($(this).val() == ''){
            federal.val('');
            federal.text('');
        }else {
            $.ajax({
                type: "get",
                async: true,
                //data:parent.serialize(),
                url: '/list-box/federal-const/' + $(this).val(),
                dataType: "html",
                success: function (data, textStatus) {
                    federal.html(data);
                }
            });
        }
        return false;
    });
});




