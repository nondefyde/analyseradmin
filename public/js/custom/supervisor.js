/**
 * Created by Cecilee2 on 8/4/2015.
 */

$(function () {

    //delete a supervisor
    $(document.body).on('click', '.delete_supervisor',function(e){
        //e.preventDefault();
        var box = $("#confirm-remove-row");
        var parent = $(this).parent().parent();
        var supervisor_name = parent.children(':nth-child(2)').text();

        $("#supervisor_name").text(supervisor_name);
        $("#confirm_supervisor_delete").val($(this).val());
        box.addClass("open");
    });

    //confirm deleting of a supervisor
    $(document.body).on('click', '#confirm_supervisor_delete',function(e){
        //e.preventDefault();
        var box = $("#confirm-remove-row");
        var sub_user_id = $(this).val();
        $.ajax({
            type: 'GET',
            async: true,
            url: '/supervisors/delete/' + sub_user_id,
            success: function(data,textStatus){
                box.removeClass("open");
                window.location.replace('/supervisors');
            },
            error: function(xhr,textStatus,error){
                alert(textStatus + ' ' + xhr);
            }
        });
        return false;
    });

    //Button to enable or disable a supervisor
    $(document.body).on('click', '.supervisor_status',function(e){
        var box = $("#confirm-status-row");
        var parent = $(this).parent().parent();
        var status_type = ($(this).attr('rel') === '1') ? 'Enable' : 'Disable';

        $("#supervisor_status").text(status_type + ' ' + parent.children(':nth-child(2)').text());
        $("#confirm_supervisor_status").val($(this).val());
        $("#confirm_supervisor_status").attr('rel', $(this).attr('rel'));
        box.addClass("open");
    });

    //Publishing or Un-publishing a project
    $(document.body).on('click', '#confirm_supervisor_status',function(e){
        //e.preventDefault();
        var box = $("#confirm-status-row");
        var user_id = $(this).val();
        var status = $(this).attr('rel');
        $.ajax({
            type: 'GET',
            async: true,
            url: '/supervisors/status/' + user_id + '/' + status,
            success: function(data,textStatus){
                box.removeClass("open");
                location.reload();
            },
            error: function(xhr,textStatus,error){
                alert(textStatus + ' ' + xhr);
            }
        });
        return false;
    });
});




