 <?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?> 
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'Page' : 'home'; ?> About Us </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> About Us </a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'Add' : 'Edit'; ?> Contents </li>
    </ol>
</div>

<div class="page-content fade-in-up">
    <div class="row">
        <div class="col-md-12">
            <div class="ibox">
                <div class="ibox-head">
                    <div class="ibox-title">page Info</div>
                        <?php 
                    ?>
                    <nav aria-label="breadcrumb">

                    <button class="btn btn-success text-white" onClick="document.getElementById('view').value='';document.getElementById('viewpage').value='saveabout';document.myform.submit() "> Save </button>
                    <button type="reset" class="btn btn-dark" onclick="document.getElementById('view').value='';document.getElementById('viewpage').value='';document.getElementById('keys').value='';document.myform.submit();"><i class="fa fa-arrow-left"></i> Back </button>
                </nav>
                </div>
            <div class="ibox-body">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="form-group row">
                    <label for="aboutUs" class="col-sm-2 col-form-label">About Us Title</label>
                    <div class="col-sm-10">
                        <input type="text" name="aboutUs" class="form-control summernote" id="summernote1" placeholder="about us title" value="<?= isset($aboutUs) ? $aboutUs : '' ?>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="ourMission" class="col-sm-2 col-form-label">Content Body</label>
                    <div class="col-sm-10">
                        <textarea name="conbody" class="form-control conbody" id="conbody" rows="5"><?= isset($conbody) ? $conbody : '' ?></textarea>
                    </div>
                </div>
          <div class="form-group row">
        <label for="img" class="col-sm-2 col-form-label">About Images:</label>
        <div class="col-sm-10">
            <input type="file" class="form-control" name="img" id="img" value="<?= !empty($picture) ? $picture : ' '; ?>"  multiple required>
            <div id="imagePreview"></div> <!-- Preview area -->
        </div>
    </div>

<hr>

                <!-- Grouped Section -->
                <div class="form-group text-center">
                    <label class="text-capitalize bold" data-toggle="collapse" href="#achievementsSection" role="button" aria-expanded="false" aria-controls="achievementsSection">Apply Grand Facilities</label>
<hr>

                    <div class="collapse show" id="achievementsSection">
                        <div class="row">
                            <div class="col-md-6">
                                <!-- Swimming Pool Textarea -->
<div class="form-group">
    <label for="swimmingPool" class="text-capitalize">Swimming Pool</label>
    <textarea name="swimmingPool" class="form-control" id="swimmingPool" rows="5"><?= isset($swimmingPool) ? $swimmingPool : '' ?></textarea>
</div>

<!-- Gym Textarea -->
<div class="form-group">
    <label for="gym" class="text-capitalize">Gym</label>
    <textarea name="gym" class="form-control" id="gym" rows="5"><?= isset($gym) ? $gym : '' ?></textarea>
</div>
</div>
<div class="col-md-6">
<!-- Bar Textarea -->
<div class="form-group">
    <label for="bar" class="text-capitalize">Bar</label>
    <textarea name="bar" class="form-control" id="bar" rows="5"><?= isset($bar) ? $bar : '' ?></textarea>
</div>

<!-- Car Park Textarea -->
<div class="form-group">
    <label for="carPark" class="text-capitalize">Car Park</label>
    <textarea name="carPark" class="form-control" id="carPark" rows="5"><?= isset($carPark) ? $carPark : '' ?></textarea>
</div>

                            </div>
                            
                            <!-- <div class="col-md-6">
                                <div class="form-group">
                                    <label for="gym" class="text-capitalize">Gym</label>
                                    <textarea name="gym" class="form-control" value="<?= isset($gym) ? $gym : '' ?>" id="gym"rows="5"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="bar" class="text-capitalize">Bar</label>
                                    <textarea name="bar" class="form-control"id="bar" rows="5"><?= isset($bar) ? $bar : '' ?>" ></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="carPark" class="text-capitalize">Car Park</label>
                                    <textarea  name="carPark" class="form-control" id="carPark" rows="5"><?= isset($carPark) ? $carPark : '' ?> </textarea>
                                </div>
                            </div> -->
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="ourMission" class="col-sm-2 col-form-label">Testimonial from our Clients </label>
                    <div class="col-sm-10">
                        <textarea name="testimonial" class="form-control testimonial" id="testimonial" rows="5"><?= isset($testimonial) ? $testimonial : '' ?></textarea>
                    </div>
                </div>
            </div>
        </div>

<hr>
        </div>
    </div>
</div>
</div>
</div>
</div>
<script>
    $(document).ready(function() {
        $('.summernote').summernote({
            height: 300
        });
    });
</script>
<script>
    // Function to handle file input change
    function previewImages() {
        var preview = document.getElementById('imagePreview');
        preview.innerHTML = ''; // Clear previous preview

        var files = document.getElementById('img').files;

        if (files.length > 0) {
            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                var reader = new FileReader();

                reader.onload = function (event) {
                    var image = document.createElement('img');
                    image.className = 'img-thumbnail'; // Bootstrap class for styling
                    image.style.marginRight = '10px'; // Optional styling
                    image.src = event.target.result;
                    preview.appendChild(image);
                }

                reader.readAsDataURL(file);
            }
        }
        else {
            preview.innerHTML = 'No images selected';
        }
    }

    // Attach the preview function to the file input onchange event
    document.getElementById('img').addEventListener('change', previewImages);
</script>
