 <?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?> 

<div class="page-heading">
    <h1 class="page-title"><?php echo empty($keys) ? 'Slide' : 'home'; ?> Page </h1>
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="index.php?pg=dashboard"> Home </a></li>
        <li class="breadcrumb-item active"><?php echo empty($keys) ? 'Add' : 'Edit'; ?> Slides </li>
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

                    <button class="btn btn-success text-white" onClick="document.getElementById('view').value='save';document.getElementById('viewpage').value='save';document.myform.submit() "> Save </button>
                    <button type="reset" class="btn btn-dark" onclick="document.getElementById('view').value='';document.getElementById('viewpage').value='';document.getElementById('keys').value='';document.myform.submit();"><i class="fa fa-arrow-left"></i> Back </button>
                                                            </nav>

                </div>
                <div class="ibox-body">
    <div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
 
    
            <div class="form-group row">
                <label for="headlings" class="col-sm-2 col-form-label"> Headlings </label>
                  <div class="col-sm-9">
                <input type="text" name="headlings" class="form-control" id="headlings" value="<?= isset($headlings) ? $headlings : '' ?>"  >

            </div>
            </div>
            <div class="form-group row">
                <label for="ourMission" class="col-sm-2 col-form-label">Contents</label>
                <div class="col-sm-9">
                <textarea name="ourMission" class="form-control summernote" id="summernote"  value="<?= isset($ourMission) ? $ourMission : '' ?>" rows="5"></textarea>
            </div>
            </div>
              <div class="form-group row">

   <label for="img"  class="col-sm-2 col-form-label">Upload Images:</label>
   <div class="col-sm-4">
        <input type="file" class="form-control" name="img[]" id="img" multiple required>
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
    document.getElementById('image-input').addEventListener('change', function() {
    const previewContainer = document.getElementById('image-preview');
    previewContainer.innerHTML = '';

    const files = this.files;

    if (files) {
        for (const file of files) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const imgElement = document.createElement('img');
                imgElement.src = e.target.result;
                previewContainer.appendChild(imgElement);
            };
            reader.readAsDataURL(file);
        }
    }
});

</script>