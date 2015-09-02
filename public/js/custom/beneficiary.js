/**
 * Created by Cecilee2 on 8/4/2015.
 */

$(function () {

    //Add new beneficiary row
    $(document.body).on('click', '.add_beneficiary',function(e){
        //e.preventDefault();
        var clone_row = $('#beneficiary_table tbody tr:last-child').clone();
        $('#beneficiary_table tbody').append(clone_row);

        clone_row.children(':nth-child(1)').html( parseInt(clone_row.children(':nth-child(1)').html())+1);
        clone_row.children(':nth-child(2)').children('input').val('');
        clone_row.children(':nth-child(2)').children('input[type=hidden]').val(-1);
        clone_row.children(':nth-child(3)').children('input').val('');
        clone_row.children(':last-child').html('<button class="btn btn-danger btn-rounded btn-condensed btn-sm remove_beneficiary"><span class="fa fa-times"></span> Remove</button>');
    });

    //remove empty beneficiary row
    $(document.body).on('click','.remove_beneficiary',function(){
        $(this).parent().parent().remove();
    });

    //confirmation modal for deleting beneficiary
    $(document.body).on('click', '.delete_beneficiary',function(e){
        e.preventDefault();
        var box = $("#confirm-remove-row");

        var parent = $(this).parent().parent();
        var beneficiary = parent.children(':nth-child(2)').children('input').val();
        var beneficiary_id = parent.children(':nth-child(2)').children('input[type=hidden]').val();

        $("#beneficiary_name").text(beneficiary);
        $("#confirm_beneficiary_delete").val(beneficiary_id);
        box.addClass("open");
    });

    ///deleting beneficiary
    $(document.body).on('click', '#confirm_beneficiary_delete',function(e){
        //e.preventDefault();
        var box = $("#confirm-remove-row");
        var beneficiary_id = $(this).val();
        var project_id = $("#project_id").val();

        $.ajax({
            type: 'GET',
            async: true,
            url: '/projects/beneficiary/delete/' + beneficiary_id + '/' + project_id,
            success: function(data,textStatus){
                box.removeClass("open");
                window.location.replace('/projects/beneficiary/' + data);
            },
            error: function(xhr,textStatus,error){
                alert(textStatus + ' ' + xhr);
            }
        });
        return false;
    });
});