// src/main/resources/static/js/scripts.js
document.addEventListener('DOMContentLoaded', function() {
    // Form validation for stock form
    const stockForm = document.querySelector('#stockForm');
    if (stockForm) {
        stockForm.addEventListener('submit', function(e) {
            const symbol = document.querySelector('#symbol').value;
            const purchasePrice = document.querySelector('#purchasePrice').value;
            const quantity = document.querySelector('#quantity').value;

            if (!symbol || purchasePrice <= 0 || quantity <= 0) {
                e.preventDefault();
                alert('Please fill all fields with valid values.');
            }
        });
    }

    // Confirm deletion
    const deleteButtons = document.querySelectorAll('.delete-btn');
    deleteButtons.forEach(button => {
        button.addEventListener('click', function(e) {
            if (!confirm('Are you sure you want to delete this stock?')) {
                e.preventDefault();
            }
        });
    });
});