/**
 * Created by Cecilee2 on 8/4/2015.
 */

$(function () {

    $(document.body).on('click', '.delete_contractor',function(e){
        //e.preventDefault();
        var box = $("#confirm-remove-row");
        var parent = $(this).parent().parent();
        var contractor_id = $(this).val();
        var contractor_name = parent.children(':nth-child(3)').text();

        $("#contractor_name").text(contractor_name);
        $("#confirm_contractor_delete").val(contractor_id);
        box.addClass("open");
    });

    $(document.body).on('click', '#confirm_contractor_delete',function(e){
        //e.preventDefault();
        var box = $("#confirm-remove-row");
        var contractor_id = $(this).val();
        $.ajax({
            type: 'GET',
            async: true,
            url: '/contractors/delete/' + contractor_id,
            success: function(data,textStatus){
                box.removeClass("open");
                window.location.replace('/contractors');
            },
            error: function(xhr,textStatus,error){
                alert(textStatus + ' ' + xhr);
            }
        });
        return false;
    });
});




