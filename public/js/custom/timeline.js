/**
 * Created by Cecilee2 on 8/4/2015.
 */

$(function () {
    $(document.body).on('click', '.reply',function(e){
        //e.preventDefault();

        var rel = $(this).attr("rel");
        $("div[rel='"+rel+"']").removeClass('hidden');
        return false;
    });

});




