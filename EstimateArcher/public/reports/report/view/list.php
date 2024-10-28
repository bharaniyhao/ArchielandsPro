<div class="page-heading">
    <h1 class="page-title"><?= empty($keys) ? 'Records' : 'Edit'; ?> Bookings</h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard">Home</a></li>
        <li class="breadcrumb-item active"><?= empty($keys) ? 'All' : 'Edit'; ?> Bookings records</li>
    </ol>
</div>

<div class="page-content fade-in-up">
    <div class="row">
        <div class="col-md-12">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">Booking Records</div>
                    <nav aria-label="breadcrumb">
                        <div class="col-md-12 text-right">
                            <!-- <?php if (!empty($printpath)) { ?>
                                <button type="button" class="btn btn-outline-info" onclick="exportReport()">
                                    <i class="fa fa-file-excel-o" aria-hidden="true"></i>
                                    Export
                                </button>
                            <?php } ?> -->
                                    <button class="btn bg-success text-white" onClick="
    document.getElementById('target').value='report'; 
    document.getElementById('viewpage').value='report'; 
    console.log('Target value:', document.getElementById('target').value); 
    console.log('Viewpage value:', document.getElementById('viewpage').value); 
    document.myform.submit()">
    <i class="fa fa-file-archive-o"></i> Show Report
</button>
                        
                    </nav>
                </div>
                <div class="ibox-body">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body bg-secondary border rounded p-3 text-white">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <label for="fromdate">From:</label>
                                                <input type="date" name="fromdate" id="fromdate" class="form-control demo" value="" autocomplete="off">
                                            </div>

                                            <div class="col-md-3 fieldspaceout">
                                                <label for="todate">To:</label>
                                                <input type="date" name="todate" id="todate" class="form-control demo" value="" autocomplete="off">
                                            </div>

                                            <div class="col-md-3 fieldspaceout">
                                                <label for="status">Status:</label>
                                                <select name="status" id="status" class="form-control demo" autocomplete="off">
                                                    <option value="all">All</option>
                                                    <option value="0">Booked</option>
                                                    <option value="1">Cancel </option>
                                                    <option value="2">Rejected</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        <!-- </div>
    </div>
    </div> -->

    <!-- Report Content -->
    <div class="row mt-2">
        <div class="col-lg-12 mb-lg-0 mb-4">
            <?php if (!empty($printpath)) { ?>
                <div class="card z-index-2 mt-4 h-100">
                    <div class="col-sm-12 paddingclose">
                        <div class="form-group mt-4">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-12 mt-4">
                                        <div class="card">
                                            <div class="card-body bg-secondary border rounded">
                                                <iframe allowtransparency="1" frameborder="0" src="<?php echo $printpath; ?>" id="printframe" name="printframe" style="width:100%; min-height:770px; border:1px #a2a2a2 solid;background-color:#fff; padding:30px 50px 30px 20px;"></iframe>
                                                <iframe allowtransparency="0" frameborder="0" src="<?php echo $export_url; ?>" id="exporter" name="exporter" style="width:900px; height:500px; display:none"></iframe>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>
</div>
</div>
</div>

<!-- Ensure that you have a form with the name 'myform' and include hidden input fields for 'viewpage', 'nfromdate', 'ntodate', and 'nstatus' --
<form name="myform" method="post" action="your_processing_script.php">
    <input type="hidden" id="viewpage" name="viewpage" value="">
    <input type="hidden" id="nfromdate" name="nfromdate" value="">
    <input type="hidden" id="ntodate" name="ntodate" value="">
    <input type="hidden" id="nstatus" name="nstatus" value="">
</form>-->


<script>
    $(document).ready(function() {
        $("#loading").hide();

        $("#genreport").click(function() {
            if ($("#fromdate").val() && $("#todate").val()) {
                $("#viewpage").val("report");
                $("#nfromdate").val($("#fromdate").val());
                $("#ntodate").val($("#todate").val());
                $("#nstatus").val($("#status").val());
                console.log("Form submission values:", $("#fromdate").val(), $("#todate").val(), $("#status").val());
                $("form[name='myform']").submit(); // Ensure the form named 'myform' exists
            } else {
                Swal.fire(
                    "Validation Error",
                    "Payment from and payment to must not be empty, and at least one other filter item",
                    'warning'
                );
            }
        });
    });

    function exportReport() {
        $("#viewpage").val('export');
        $("#nfromdate").val('<?= $fromdate; ?>');
        $("#ntodate").val('<?= $todate; ?>');
        $("#nstatus").val('<?= $status; ?>');
        $("form[name='myform']").submit(); // Ensure the form named 'myform' exists
    }
</script>
