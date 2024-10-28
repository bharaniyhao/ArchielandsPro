<!-- JavaScript to toggle visibility of patient fields -->
    <script>
        const patientStatusSelect = document.getElementById('patientStatus');
        const existingPatientFields = document.getElementById('existingPatientFields');
        const nonExistingPatientFields = document.getElementById('nonExistingPatientFields');

        function togglePatientFields() {
            if (patientStatusSelect.value === 'existing') {
                existingPatientFields.style.display = 'block';
                nonExistingPatientFields.style.display = 'none';
            } else {
                existingPatientFields.style.display = 'none';
                nonExistingPatientFields.style.display = 'block';
            }
        }

        togglePatientFields(); // Call initially to set initial state
        patientStatusSelect.addEventListener('change', togglePatientFields);
    </script>
