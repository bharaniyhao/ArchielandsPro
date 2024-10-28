<?php include('controller.php') ?>

<style>
    .eltbutnapp {
        width: 300px;
        height: 40px;
        border: 1px solid #efefef;
    }

    #reasonlist,
    #reasonapp {
        display: none;
    }
</style>
<!-- <form name="myform" class="pager-form" method="post" action="#">

    <input type="text" name="action_key" id="action_key" value="<?php echo md5(microtime()); ?>" />
    <input type="text" value="" name="viewpage" id="viewpage" />
    <input type="text" value="" name="target" id="target" />
    <input type="text" value="" name="ukeys" id="ukeys" />
    <input type="text" value="" name="yearinput" id="yearinput" />
    <input type="text" value="" name="monthinput" id="monthinput" /> -->


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
                        <button class="btn btn-info text-white" onClick="
    document.getElementById('target').value='report'; 
    document.getElementById('viewpage').value='report'; 
    console.log('Target value:', document.getElementById('target').value); 
    console.log('Viewpage value:', document.getElementById('viewpage').value); 
    document.myform.submit()">
    <i class="fa fa-file-archive-o"></i> Show Report
</button>

                        <!-- <button class="btn btn-info text-white" onClick="document.getElementById('target').value='report'; document.getElementById('viewpage').value='report'; document.myform.submit()">
                            <i class="fa fa-file-archive-o"></i> Show Report
                        </button> -->
                        <button type="submit" class="btn btn-success text-white" onClick="document.getElementById('target').value=''; document.getElementById('viewpage').value='exportxml'; document.getElementById('ukeys').value='<?= $inputelt; ?>'; document.getElementById('monthinput').value='<?= $month; ?>'; document.getElementById('yearinput').value='<?= $year; ?>'; document.myform.submit()">
                        <i class="fa fa-file-excel"></i> Download Excel </button>
                    </nav>
                </div>
                <div class="ibox-body">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body bg-info border rounded p-3">
                                    <section class="design-process-section" id="process-tab">
                                        <div role="" class="tab-pane active" id="accountdetails">
                                            <div class="form-group row">
                                                <div class="col-md-4">
                                                    <label for="inputmonth">Month <span class="text-danger">*</span></label>
                                                    <select class="form-control select2 shadow-none" name="inputmonth" id="inputmonth">
                                                        <option selected disabled>Select Month</option>
                                                        <option value="01">January</option>
                                                        <option value="02">February</option>
                                                        <option value="03">March</option>
                                                        <option value="04">April</option>
                                                        <option value="05">May</option>
                                                        <option value="06">June</option>
                                                        <option value="07">July</option>
                                                        <option value="08">August</option>
                                                        <option value="09">September</option>
                                                        <option value="10">October</option>
                                                        <option value="11">November</option>
                                                        <option value="12">December</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-3">
                                                    <label for="inputyear">Enter Year <span class="text-danger">*</span></label>
                                                    <input type="number" name="inputyear" id="inputyear" placeholder="Enter year" class="form-control" value="<?= date('Y') ?>">
                                                </div>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <?php if (!empty($printpath)) { ?>
                                    <div class="card">
                                        <div class="card-body bg-secondary text-white">
                                            <iframe allowtransparency="1" frameborder="0" src="<?= $printpath; ?>" id="printframe" name="printframe" class="w-100" style="min-height:770px; border:1px solid #a2a2a2; background-color:#fff; padding:30px 50px 30px 40px;"></iframe>
                                            <iframe allowtransparency="0" frameborder="0" src="<?= $export_url; ?>" id="exporter" name="exporter" class="d-none" style="width:900px; height:500px;"></iframe>
                                        </div>
                                    </div>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

                    <!-- <div class="container-fluid">
            <div class="row">
                <div class="col-12">

                    <div class="card">
                        <div class="card-body" style="background-color:#dedede">

                            <iframe allowtransparency="1" frameborder="0" src="<?php echo $printpath; ?>" id="printframe"
                                name="printframe"
                                style="width:100%; min-height:770px; border:1px #a2a2a2 solid;background-color:#fff; padding:30px 50px 30px 40px;"></iframe>

                            <iframe allowtransparency="0" frameborder="0" src="<?php echo $export_url; ?>" id="exporter"
                                name="exporter" style="width:900px; height:500px; display:none"></iframe>


                        </div>

                    </div>
                </div>
            </div>
        </div> -->

</form>