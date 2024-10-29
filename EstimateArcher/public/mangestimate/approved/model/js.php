<script>
    var invoiceNumberGenerated = false;

    function generateInvoiceNumber() {
        if (!invoiceNumberGenerated) {
            var date = new Date();
            var year = date.getFullYear();
            var month = (date.getMonth() + 1).toString().padStart(2, '0');
            var day = date.getDate().toString().padStart(2, '0');
            var hours = date.getHours().toString().padStart(2, '0');
            var minutes = date.getMinutes().toString().padStart(2, '0');
            var seconds = date.getSeconds().toString().padStart(2, '0');
            var milliseconds = date.getMilliseconds().toString().padStart(3, '0');
            var invoiceNumber = 'INV' + year + month + day + hours + minutes + seconds + milliseconds;

            document.getElementById("invoiceNumber").value = invoiceNumber;
            invoiceNumberGenerated = true;
        }
    }

    function addItem() {
        generateInvoiceNumber();

        var tableBody = document.getElementById("invoiceItemsTable").getElementsByTagName("tbody")[0];
        var rowIndex = tableBody.rows.length;
        var newRow = tableBody.insertRow();

        var descriptionCell = newRow.insertCell(0);
        var qtyCell = newRow.insertCell(1);
        var unitCell = newRow.insertCell(2);
        var unitPriceCell = newRow.insertCell(3);
        var totalCell = newRow.insertCell(4);
        var actionCell = newRow.insertCell(5);

        descriptionCell.innerHTML = `<input type="text" name="invoiceItems[${rowIndex}][description]" class="form-control">`;
        qtyCell.innerHTML = `<input type="number" name="invoiceItems[${rowIndex}][qty]" class="form-control" onchange="calculateTotal(this)">`;
        unitCell.innerHTML = `<input type="text" name="invoiceItems[${rowIndex}][unit]" class="form-control">`;
        unitPriceCell.innerHTML = `<input type="number" name="invoiceItems[${rowIndex}][unitPrice]" class="form-control" onchange="calculateTotal(this)">`;
        totalCell.innerHTML = `<input type="number" name="invoiceItems[${rowIndex}][total]" class="form-control" readonly>`;
        actionCell.innerHTML = `<button type="button" class="btn btn-danger" onclick="removeItem(this)">Remove</button>`;
    }

    function removeItem(button) {
        var row = button.parentNode.parentNode;
        row.parentNode.removeChild(row);
        calculateOverallTotal();
    }

    function calculateTotal(input) {
        var row = input.parentNode.parentNode;
        var qtyInput = row.cells[1].getElementsByTagName("input")[0];
        var unitPriceInput = row.cells[3].getElementsByTagName("input")[0];
        var totalInput = row.cells[4].getElementsByTagName("input")[0];

        var qty = parseFloat(qtyInput.value);
        var unitPrice = parseFloat(unitPriceInput.value);
        var total = isNaN(qty) || isNaN(unitPrice) ? 0 : qty * unitPrice;

        totalInput.value = total.toFixed(2);
        calculateOverallTotal();
    }

    function calculateOverallTotal() {
        var tableBody = document.getElementById("invoiceItemsTable").getElementsByTagName("tbody")[0];
        var rows = tableBody.getElementsByTagName("tr");
        var overallTotal = 0;

        for (var i = 0; i < rows.length; i++) {
            var totalInput = rows[i].cells[4].getElementsByTagName("input")[0];
            var total = parseFloat(totalInput.value);
            overallTotal += isNaN(total) ? 0 : total;
        }

        document.getElementById("overallTotal").value = overallTotal.toFixed(2);
    }

    function validateInvoiceItems() {
        var rows = document.querySelectorAll("#invoiceItemsTable tbody tr");
        for (var i = 0; i < rows.length; i++) {
            var inputs = rows[i].querySelectorAll("input");
            for (var j = 0; j < inputs.length; j++) {
                if (inputs[j].value.trim() === "") {
                    alert("Please fill all fields for each invoice item.");
                    return false;
                }
            }
        }
        return true;
    }

    function debugFormSubmission() {
        var formData = new FormData(document.querySelector('form'));
        for (var pair of formData.entries()) {
            console.log(pair[0] + ', ' + pair[1]);
        }
    }

    function submitForm(event) {
        event.preventDefault();

        if (validateInvoiceItems()) {
            debugFormSubmission();
            alert("Form is ready for submission!");
        }
    }
</script>

    <script>
    $(document).ready(function() {
        $('.selectpicker').selectpicker();
    });
</script>