/**
 * Created by Cecilee2 on 8/5/2015.
 */
$(function(){

    function onSuccess(){
        $("#cp_photo").parent("a").find("span").html("Choose another photo");

        var img = $("#cp_target").find("#crop_image")

        if(img.length === 1){
            $("#cp_img_path").val(img.attr("src"));

            img.cropper({aspectRatio: 1,
                done: function(data) {
                    $("#ic_x").val(data.x);
                    $("#ic_y").val(data.y);
                    $("#ic_h").val(data.height);
                    $("#ic_w").val(data.width);
                }
            });

            $("#cp_accept").prop("disabled",false).removeClass("disabled");

            $("#cp_accept").on("click",function(){
                $("#user_image").html('<img src="img/loaders/default.gif"/>');
                $("#modal_change_photo").modal("hide");

                //console.log($('#cp_crop').serialize());

                $.ajax({
                    url: 'profiles/crop-picture',
                    data: $('#cp_crop').serialize(),
                    method :'POST',
                    success: function(data){
                        $("#user_image").html('<img src="/' +data +'" class="img-thumbnail"/>');
                        $(".p_image").html('<img src="/' +data +'"/>');
                        console.log(data);
                    },
                    error: function(error){
                        console.log(error);
                    }
                });

                //$("#cp_crop").ajaxForm({target: '#user_image'}).submit();
                //$("#cp_crop").reset();
                //location.reload();

                $("#cp_target").html("Use form below to upload file. Only .jpg files.");
                $("#cp_photo").val("").parent("a").find("span").html("Select file");
                $("#cp_accept").prop("disabled",true).addClass("disabled");
                $("#cp_img_path").val("");

                //$('#user_image').html('<img src="/uploads/avartars/1_avartar.jpg" class="img-thumbnail"/>');

            });
        }
    }

    $("#cp_photo").on("change",function(){

        if($("#cp_photo").val() == '') return false;

        $("#cp_target").html('<img src="img/loaders/default.gif"/>');
        $("#cp_upload").ajaxForm({target: '#cp_target',success: onSuccess}).submit();
    });

    //Change Password via modal in users profile
    $(document.body).on('submit', '#password_change_form',function(e){
        //e.preventDefault();
        var values = $(this).serialize();
        $.ajax({
            type: 'POST',
            async: true,
            data: values,
            url: 'profiles/change',
            success: function(data,textStatus){
                if(data.status == 0){
                    $('#error_msg').html(data.msg);
                    $('#error_msg').removeClass('hide');
                    $('#error_msg').addClass('alert-danger');
                }else if(data.status == 1){
                    $('#msg_box').removeClass('hide');
                    $('#msg_box').addClass('alert-success');
                    $('#msg_box').html(data.msg);
                    $('#modal_change_password').modal('hide');
                    $('#msg_box').delay(8000).slideUp(850);
                }
                //location.reload();
            },
            error: function(xhr,textStatus,error){
                alert(textStatus + ' ' + xhr);
            }
        });
        return false;
    });

    //Restrict user from selecting future dates as date of birth
    //$( "#dob" ).datepicker({ dateFormat: "yyyy-mm-dd",  maxDate: -1 });


    // Ajax Get Local Governments Based on the state
    getDependentListBox($('#state_id'), $('#lga_id'), '/list-box/lga/');
});