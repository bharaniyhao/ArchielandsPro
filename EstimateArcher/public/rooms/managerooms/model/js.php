<script>
function fetchDescriptions(categoryId) {
    if (categoryId) {
        fetch('public/rooms/managerooms/controller.php?catId=' + categoryId)
            .then(response => response.json())
            .then(data => {
                let roomSelect = document.getElementById('room');
                roomSelect.innerHTML = '<option value="" selected disabled>Select Description</option>';
                data.forEach(desc => {
                    let option = document.createElement('option');
                    option.value = desc.CAT_ID;
                    option.textContent = desc.CAT_DESC;
                    roomSelect.appendChild(option);
                });
                $('.selectpicker').selectpicker('refresh'); // To refresh Bootstrap selectpicker
            })
            .catch(error => console.error('Error fetching descriptions:', error));
    }
}
</script>