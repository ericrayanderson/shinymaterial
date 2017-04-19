$(document).ready(function () {
    $('.modal').modal({
        dismissible: false
    });
    $(document).on("click", ".shiny-material-modal-trigger", function () {
        $(this).trigger("shown");
    });
});
