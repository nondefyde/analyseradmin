/**
 * Created by Cecilee2 on 8/4/2015.
 */

$(function () {

    //Add new beneficiary row
    $(document.body).on('click', '.add_domain',function(e){
        //e.preventDefault();
        var clone_row = $('#domain_table tbody tr:last-child').clone();
        $('#domain_table tbody').append(clone_row);

        clone_row.children(':nth-child(1)').html( parseInt(clone_row.children(':nth-child(1)').html())+1);
        clone_row.children(':nth-child(2)').children('select').val('');
        clone_row.children(':nth-child(2)').children('input[type=hidden]').val(-1);
        clone_row.children(':nth-child(3)').children('select').html('<option value="">Nothing Selected</option>');
        clone_row.children(':nth-child(4)').children('input').val('');
        clone_row.children(':nth-child(5)').children('input').val('');
        clone_row.children(':last-child').html('<button class="btn btn-danger btn-rounded btn-condensed btn-sm remove_domain"><span class="fa fa-times"></span> Remove</button>');
    });

    //remove empty beneficiary row
    $(document.body).on('click','.remove_domain',function(){
        $(this).parent().parent().remove();
    })

    //on change of state get lga
    $(document.body).on('change','.state_select',function(){
        var child = $(this).parent().next().children(':nth-child(1)');
        // Ajax Get Local Governments Based on the state
        if($(this).val() == ''){
            child.val('');
        }else {
            $.ajax({
                type: "get",
                async: true,
                //data:parent.serialize(),
                url: '/lga/' + $(this).val(),
                dataType: "html",
                success: function (data, textStatus) {
                    child.html(data);
                }
            });
        }
        return false;
    });

    //confirmation modal for deleting beneficiary
    $(document.body).on('click', '.delete_domain',function(e){
        e.preventDefault();
        var box = $("#confirm-remove-row");

        var parent = $(this).parent().parent();
        var domain = parent.children(':nth-child(2)').children('select').children('option:selected').text();
        var domain_id = parent.children(':nth-child(2)').children('input[type=hidden]').val();

        $("#domain_name").text(domain);
        $("#confirm_domain_delete").val(domain_id);
        box.addClass("open");
    });

    ///deleting beneficiary
    $(document.body).on('click', '#confirm_domain_delete',function(e){
        //e.preventDefault();
        var box = $("#confirm-remove-row");
        var domain_id = $(this).val();
        var project_id = $("#project_id").val();

        $.ajax({
            type: 'GET',
            async: true,
            url: '/projects/domain/delete/' + domain_id + '/' + project_id,
            success: function(data,textStatus){
                box.removeClass("open");
                window.location.replace('/projects/domain/' + data);
            },
            error: function(xhr,textStatus,error){
                alert(textStatus + ' ' + xhr);
            }
        });
        return false;
    });
});