<script>
    $(document).ready(function(e) {
        /*
         * This script below set the geolocation
         * of a facility
         * Author:: Acker
         */
        $('#savegeolocation').click(function(e) {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
            }

            function showPosition(position) {
                var latitude = position.coords.latitude;
                var longitude = position.coords.longitude;

                $.ajax({
                    type: 'POST',
                    url: 'public/dashboard/model/saveGeolocation.php',
                    data: {
                        'latitude': latitude,
                        'longitude': longitude
                    },
                    success: function(e) {

                        swal({
                            title: "Success",
                            text: "Geolocation set successfully.",
                            type: "success",
                            showCancelButton: false,
                            confirmButtonColor: '',
                            confirmButtonText: "",
                            closeOnConfirm: true
                        });

                        $('#geolocationinfo').hide();
                    },
                    error: function(e) {
                        console.log(e);
                    }
                });

            }

        });
        /*
         * End of geolocation script
         */

        /*
         * This is a dynamic search 
         * on the dashboard
         * 
         */
        $('#searchdash').keyup(function() {
            var dashsearch = $("#searchdash").val();
            $.ajax({
                type: 'POST',
                url: 'public/dashboard/model/searchmodule.php',
                data: {
                    'dashsearch': dashsearch
                },
                success: function(e) {
                    $('#dashidash').html(e);
                },
                error: function(e) {
                    console.log(e);
                }
            });
        });
        //End dashboard search



        // setInterval( function(e) {
        //    e.preventDefault();
        //     $.ajax({
        //         type: 'POST',
        //         url: 'public/dashboard/model/renderdashboard.php',
        //         dataType: 'json',
        //         success: function(e){
        //             $('.dashboard').html(e);
        //         },
        //     });
        // }, 30000);


    });


    // setInterval( function() {

    // }, 30000);
</script>