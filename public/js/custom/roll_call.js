/**
 * Created by Cecilee2 on 8/4/2015.
 */

$(function () {

    $(document.body).on('click', '.roll_call_all', function () {

        var check_boxes = $('.roll_call_check_box');
        if($(this).is(':checked')){
            check_boxes.prop('checked', true);
            $(this).parent().children('span').html('Un check All');
            check_boxes.parent().children('span').html('Present');
            check_boxes.parent().children('span').prop('class', 'label label-success');
        }else{
            check_boxes.prop('checked', false);
            $(this).parent().children('span').html('Check All');
            check_boxes.parent().children('span').html('Absent');
            check_boxes.parent().children('span').prop('class', 'label label-danger');
        }
    });

    $(document.body).on('click', '.roll_call_check_box', function () {

        if($(this).is(':checked')){
            $(this).parent().children('span').html('Present');
            $(this).parent().children('span').prop('class', 'label label-success');
        }else{
            $('.roll_call_all').prop('checked', false);
            $('.roll_call_all').parent().children('span').html('Check All');
            $(this).parent().children('span').html('Absent');
            $(this).parent().children('span').prop('class', 'label label-danger');
        }
    });
});




