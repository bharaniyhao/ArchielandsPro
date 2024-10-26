/**
 *
 * @param {*} type options[success, error, info, warning]
 * @param {*} msg
 * @param {*} title
 */
let showToastr = (type, msg, title = "") => {
    toastr.options = {
        closeButton: true,
        debug: false,
        newestOnTop: false,
        progressBar: true,
        positionClass: "toast-top-right",
        preventDuplicates: false,
        showDuration: "300",
        hideDuration: "1000",
        timeOut: "5000",
        extendedTimeOut: "1000",
        showEasing: "swing",
        hideEasing: "linear",
        showMethod: "fadeIn",
        hideMethod: "fadeOut",
    };

    var $toast = toastr[type](msg, title); // Wire up an event handler to a button in the toast, if it exists
    $toastlast = $toast;
};

let showAlert = (
    type = "warning",
    title = "Warning",
    message,
    confirmbtn = "OK"
) => {
    swal({
        title: title,
        text: message,
        type: type,
        showCancelButton: false,
        confirmButtonColor: "",
        confirmButtonText: confirmbtn,
        closeOnConfirm: false,
    });
};

let showConfirmationAlert = (
    type = "warning",
    msg,
    title = "Are you sure?",
    confirmbtnclass = "btn-warning",
    confirmbtntext = "Yes, delete it!",
    confirmcallbackftn
) => {
    swal({
            title: title,
            text: msg,
            type: type,
            showCancelButton: true,
            confirmButtonClass: confirmbtnclass,
            confirmButtonText: confirmbtntext,
            closeOnConfirm: true,
            closeOnCancel: true,
        },
        function(isConfirm) {
            isConfirm && confirmcallbackftn();
            /*
            if (isConfirm) {
              showAlert(
                "success",
                "Deleted!",
                "Your imaginary file has been deleted."
              );
            } else {
              showAlert("error", "Cancelled", "Your imaginary file is safe :)");
            }
            */
        }
    );
};

function confirmSubmit(title, icon = 'warning', message, confirmbtn, action, key) {
    Swal.fire({
        title: title,
        text: message,
        type: icon,
        showCancelButton: true,
        confirmButtonColor: '',
        confirmButtonText: confirmbtn,
        closeOnConfirm: false
    }).then((result) => {
        if (result.value) {
            document.getElementById('viewpage').value = action;
            document.getElementById('keys').value = key;
            document.myform.submit();
        }
    });
}

let numberInputOnly = (inputclass) => {
    let ele = document.getElementsByClassName(inputclass);
    if (ele) {
        ele.addEventListener("keydown", function(event) {
            // Allow: backspace, delete, tab, escape, and enter

            if (
                event.keyCode == 46 ||
                event.keyCode == 8 ||
                event.keyCode == 9 ||
                event.keyCode == 27 ||
                event.keyCode == 13 ||
                event.keyCode == 190 ||
                event.keyCode == 110 ||
                event.keyCode == 173
            ) {
                // let it happen, don't do anything
                return;
            } else {
                // Ensure that it is a number and stop the keypress
                if (
                    event.shiftKey ||
                    ((event.keyCode < 48 || event.keyCode > 57) &&
                        (event.keyCode < 96 || event.keyCode > 105))
                ) {
                    event.preventDefault();
                }
            }
        });
    }
};

let checkOnlineStatus = () => {
    let onlinestatus = window.navigator.onLine;
    onlinestatus === false &&
        showToastr("error", "You have lost internet connection.", "Network Error!");
};

// setInterval(() => {
//   checkOnlineStatus();
// }, 100);

window.addEventListener("load", (event) => {
    checkOnlineStatus();
});