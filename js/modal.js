document.addEventListener('DOMContentLoaded', () => {
    const openButtons = document.querySelectorAll('[data-modal-target]');
    const closeButtons = document.querySelectorAll('[data-close-button]');
    const overlay = document.getElementById('overlay');

    const closeModal = () => {
        const modals = document.querySelectorAll('.modal.block');
        modals.forEach(modal => {
            modal.classList.remove('block');
            modal.classList.add('hidden');
        });
        overlay.classList.remove('block');
        overlay.classList.add('hidden');
    };

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

    closeButtons.forEach(button => {
        button.addEventListener('click', closeModal);
    });

    overlay.addEventListener('click', closeModal);

    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') {
            closeModal();
        }
    });

    document.querySelectorAll('.modal').forEach(modal => {
        modal.addEventListener('click', (e) => {
            if (!e.target.closest('.modal-content')) {
                closeModal();
            }
        });
    });
});
