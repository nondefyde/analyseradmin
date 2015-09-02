/**
 * Created by Cecilee2 on 8/4/2015.
 */

$(function () {

    //Validate MoU File
    validateDocumentFile($('#mou'));
    //Validate Award Letter File
    validateDocumentFile($('#award_letter'));

    //Button to archive a project
    $(document.body).on('click', '.delete_project',function(e){
        //e.preventDefault();
        var box = $("#confirm-remove-row");
        var parent = $(this).parent().parent();
        var project_id = $(this).val();
        var project_name = parent.children(':nth-child(2)').text();

        $("#project_name").text(project_name);
        $("#confirm_project_delete").val(project_id);
        box.addClass("open");
    });

    //Archiving a project
    $(document.body).on('click', '#confirm_project_delete',function(e){
        //e.preventDefault();
        var box = $("#confirm-remove-row");
        var project_id = $(this).val();
        $.ajax({
            type: 'GET',
            async: true,
            url: '/projects/archive/' + project_id,
            success: function(data,textStatus){
                box.removeClass("open");
                location.reload();
                //window.location.replace('/projects');
            },
            error: function(xhr,textStatus,error){
                alert(textStatus + ' ' + xhr);
            }
        });
        return false;
    });

    //Button to publish or un-publish a project
    $(document.body).on('click', '.publish_project',function(e){
        var box = $("#confirm-publish-row");
        var parent = $(this).parent().parent();
        var project_type = ($(this).attr('rel') === '1') ? 'Publish' : 'Unpublish';

        $("#publish_name").text(project_type + ' ' + parent.children(':nth-child(2)').text());
        $("#confirm_project_publish").val($(this).val());
        $("#confirm_project_publish").attr('rel', $(this).attr('rel'));
        box.addClass("open");
    });

    //Publishing or Un-publishing a project
    $(document.body).on('click', '#confirm_project_publish',function(e){
        //e.preventDefault();
        var box = $("#confirm-publish-row");
        var project_id = $(this).val();
        var publish_id = $(this).attr('rel');
        $.ajax({
            type: 'GET',
            async: true,
            url: '/projects/publish/' + project_id + '/' + publish_id,
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

//Previewing an uploaded file
(function (a) {
    a.createModal = function (b) {
        defaults = {title: "", message: "Your Message Goes Here!", closeButton: true, scrollable: false};
        var b = a.extend({}, defaults, b);
        var c = (b.scrollable === true) ? 'style="max-height: 420px;overflow-y: auto;"' : "";
        html = '<div class="modal fade" id="myModal">';
        html += '<div class="modal-dialog">';
        html += '<div class="modal-content">';
        html += '<div class="modal-header">';
        html += '<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>';
        if (b.title.length > 0) {
            html += '<h4 class="modal-title">' + b.title + "</h4>"
        }
        html += "</div>";
        html += '<div class="modal-body" ' + c + ">";
        html += b.message;
        html += "</div>";
        html += '<div class="modal-footer">';
        if (b.closeButton === true) {
            html += '<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>'
        }
        html += "</div>";
        html += "</div>";
        html += "</div>";
        html += "</div>";
        a("body").prepend(html);
        a("#myModal").modal().on("hidden.bs.modal", function () {
            a(this).remove()
        })
    }
})(jQuery);

/*
 * Here is how you use it-
 */
$(function () {
    $('.view-pdf').on('click', function () {
        var pdf_link = $(this).attr('href');
        var iframe = '<div class="iframe-container"><iframe src="' + pdf_link + '"></iframe></div>'
        $.createModal({
            title: $(this).attr('rel'),
            message: iframe,
            closeButton: true,
            scrollable: false
        });
        return false;
    });
})