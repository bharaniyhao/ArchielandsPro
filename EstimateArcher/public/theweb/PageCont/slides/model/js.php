
<script>
 // Generate a unique invoice number based on the current date and time
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