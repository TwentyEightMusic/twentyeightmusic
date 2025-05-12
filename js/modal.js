document.addEventListener('DOMContentLoaded', function() {
    const openButtons = document.querySelectorAll('[data-modal-target]');
    const closeButtons = document.querySelectorAll('[data-close-button]');
    const overlay = document.getElementById('overlay');

    // Open modal
    openButtons.forEach(button => {
        button.addEventListener('click', () => {
            const modal = document.querySelector(button.dataset.modalTarget);
            if (modal) {
                modal.classList.remove('hidden');
                modal.classList.add('block');
                overlay.classList.remove('hidden');
                overlay.classList.add('block');
            }
        });
    });

    // Close modal
    function closeModal() {
        const modals = document.querySelectorAll('.modal.block');
        modals.forEach(modal => {
            modal.classList.remove('block');
            modal.classList.add('hidden');
        });
        overlay.classList.remove('block');
        overlay.classList.add('hidden');
    }

    // Close on close button click
    closeButtons.forEach(button => {
        button.addEventListener('click', closeModal);
    });

    // Close on overlay click
    overlay.addEventListener('click', closeModal);

    // Close on ESC key
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') {
            closeModal();
        }
    });

    // Close when clicking outside the modal content
    document.querySelectorAll('.modal').forEach(modal => {
        modal.addEventListener('click', (e) => {
            // Only close if clicked outside the content
            if (!e.target.closest('.modal-content')) {
                closeModal();
            }
        });
    });
});
