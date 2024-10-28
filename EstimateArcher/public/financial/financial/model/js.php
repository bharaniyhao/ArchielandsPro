
<script>
 // Generate a unique invoice number based on the current date and time
  function generateInvoiceNumber() {
    var date = new Date();
    var year = date.getFullYear();
    var month = (date.getMonth() + 1).toString().padStart(2, '0');
    var day = date.getDate().toString().padStart(2, '0');
    var hours = date.getHours().toString().padStart(2, '0');
    var minutes = date.getMinutes().toString().padStart(2, '0');
    var seconds = date.getSeconds().toString().padStart(2, '0');
    var milliseconds = date.getMilliseconds().toString().padStart(3, '0');
    var invoiceNumber = year + month + day + hours + minutes + seconds + milliseconds;
    return invoiceNumber;
  }

  function addItem() {
    // Get the table body
    var tableBody = document.getElementById("invoiceItemsTable").getElementsByTagName("tbody")[0];

    // Create a new row
    var newRow = tableBody.insertRow();

    // Create cells for description, quantity, unit price, total, and action
    var descriptionCell = newRow.insertCell(0);
    var quantityCell = newRow.insertCell(1);
    var unitPriceCell = newRow.insertCell(2);
    var totalCell = newRow.insertCell(3);
    var actionCell = newRow.insertCell(4);

    // Add input fields to cells
    descriptionCell.innerHTML = '<input type="text" class="form-control">';
    quantityCell.innerHTML = '<input type="number" class="form-control" onchange="calculateTotal(this)">';
    unitPriceCell.innerHTML = '<input type="number" class="form-control" onchange="calculateTotal(this)">';
    totalCell.innerHTML = '<input type="number" class="form-control" readonly>';
    actionCell.innerHTML = '<button type="button" class="btn btn-danger" onclick="removeItem(this)">Remove</button>';
  }

  function removeItem(button) {
    // Get the row to be removed
    var row = button.parentNode.parentNode;

    // Remove the row from the table
    row.parentNode.removeChild(row);
  }

  function calculateTotal(input) {
    // Get the row containing the input
    var row = input.parentNode.parentNode;

    // Get the quantity and unit price inputs
    var quantityInput = row.cells[1].getElementsByTagName("input")[0];
    var unitPriceInput = row.cells[2].getElementsByTagName("input")[0];
    var totalInput = row.cells[3].getElementsByTagName("input")[0];

    // Calculate the total
    var quantity = parseFloat(quantityInput.value);
    var unitPrice = parseFloat(unitPriceInput.value);
    var total = isNaN(quantity) || isNaN(unitPrice) ? 0 : quantity * unitPrice;

    // Set the total input value
    totalInput.value = total.toFixed(2);

    document.getElementById("invoiceNumber").value = generateInvoiceNumber();
  }
  
</script>