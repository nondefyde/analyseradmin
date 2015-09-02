/**
 * Created by Cecilee2 on 8/4/2015.
 */
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

    //Delete Votes And Proceedings
    $(document.body).on('click', '.delete_vote_proceeding', function (e) {
        e.preventDefault();
        var box = $("#confirm-remove-row");

        var parent = $(this).parent().parent();
        var vol = parent.children(':nth-child(2)').text();
        var no = parent.children(':nth-child(3)').text();
        var house = parent.children(':nth-child(4)').text();
        var sess = parent.children(':nth-child(5)').text();

        $("#vote_proceeding_name").text(' Vol: ' + vol + ', No: ' + no + ', House: ' + house + ', ' + sess);
        $("#confirm_vote_proceeding_delete").val($(this).val());
        box.addClass("open");
    });

    $(document.body).on('click', '#confirm_vote_proceeding_delete', function (e) {
        //e.preventDefault();
        var box = $("#confirm-remove-row");
        var vote_proceeding_id = $(this).val();
        $.ajax({
            type: 'GET',
            async: true,
            url: '/vote-proceedings/delete/' + vote_proceeding_id,
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
})