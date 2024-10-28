 <?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?> 
<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'Page' : 'home'; ?>  Content Details  </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
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
                        <input type="text" name="aboutUs" class="form-control summernote" id="summernote1" value="<?= isset($aboutUs) ? $aboutUs : '' ?>">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="ourMission" class="col-sm-2 col-form-label">Content Body</label>
                    <div class="col-sm-10">
                        <textarea name="conbody" class="form-control conbody" id="conbody" rows="5"><?= isset($conbody) ? $conbody : '' ?></textarea>
                    </div>
                </div>
        <div class="form-group row">
        <label class="col-sm-2 col-form-label">About Images:</label>
        <div class="col-sm-10">
            <?php if (!empty($picture)) : ?>
                <img src="<?= $picture ?>" alt="Image" class="rounded-circle img-fluid" width="100" height="100">
            <?php else : ?>
                <p>No Image</p>
            <?php endif; ?>
        </div>
    </div>


                <!-- Grouped Section -->
                <div class="form-group text-center">
                    <label class="text-capitalize" data-toggle="collapse" href="#achievementsSection" role="button" aria-expanded="false" aria-controls="achievementsSection">Apply Grand Facilities</label>
                    <div class="collapse show" id="achievementsSection">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="restaurant" class="text-capitalize">Restaurant</label>
                                    <input type="number" name="restaurant" class="form-control" value="<?= isset($restaurant) ? $restaurant : '' ?>" id="restaurant">
                                </div>
                                <div class="form-group">
                                    <label for="sportsClub" class="text-capitalize">Sports Club</label>
                                    <input type="number" name="sportsClub" class="form-control" value="<?= isset($sportsClub) ? $sportsClub : '' ?>" id="sportsClub">
                                </div>
                                <div class="form-group">
                                    <label for="swimmingPool" class="text-capitalize">Swimming Pool</label>
                                    <input type="number" name="swimmingPool" class="form-control" value="<?= isset($swimmingPool) ? $swimmingPool : '' ?>" id="swimmingPool">
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="gym" class="text-capitalize">Gym</label>
                                    <input type="number" name="gym" class="form-control" value="<?= isset($gym) ? $gym : '' ?>" id="gym">
                                </div>
                                <div class="form-group">
                                    <label for="bar" class="text-capitalize">Bar</label>
                                    <input type="number" name="bar" class="form-control" value="<?= isset($bar) ? $bar : '' ?>" id="bar">
                                </div>
                                <div class="form-group">
                                    <label for="carPark" class="text-capitalize">Car Park</label>
                                    <input type="number" name="carPark" class="form-control" value="<?= isset($carPark) ? $carPark : '' ?>" id="carPark">
                                </div>
                            </div>
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
