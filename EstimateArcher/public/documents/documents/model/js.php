<?php error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const fileInput = document.getElementById('documentFile');
    const imagePreview = document.getElementById('imagePreview');
    const documentPreview = document.getElementById('documentPreview');
    const noDocumentPreview = document.getElementById('noDocumentPreview');

    fileInput.addEventListener('change', function() {
        const file = this.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const fileType = file.type;
                if (fileType.includes('image')) {
                    // For image files
                    imagePreview.src = e.target.result;
                    imagePreview.classList.remove('d-none');
                    documentPreview.classList.add('d-none');
                    noDocumentPreview.classList.add('d-none');
                } else if (fileType.includes('pdf') || fileType.includes('word')) {
                    // For PDF or Word documents
                    documentPreview.src = URL.createObjectURL(file);
                    documentPreview.classList.remove('d-none');
                    imagePreview.classList.add('d-none');
                    noDocumentPreview.classList.add('d-none');
                } else {
                    // Unsupported file type
                    imagePreview.classList.add('d-none');
                    documentPreview.classList.add('d-none');
                    noDocumentPreview.classList.remove('d-none');
                    noDocumentPreview.innerText = 'Unsupported file type';
                }
            };
            reader.readAsDataURL(file);
        } else {
            imagePreview.classList.add('d-none');
            documentPreview.classList.add('d-none');
            noDocumentPreview.classList.remove('d-none');
            noDocumentPreview.innerText = 'No document selected';
        }
    });

    fileInput.addEventListener('change', function() {
        const fileName = this.files[0].name;
        const label = document.querySelector('.custom-file-label');
        label.innerText = fileName;
    });
});
</script>
