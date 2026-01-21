const loadGigs = async () => {
    const gigsContainer = document.querySelector('.gigs-list');
    if (!gigsContainer) return;

    try {
        const response = await fetch('data/gigs.json');
        const gigs = await response.json();

        gigs.sort((a, b) => new Date(a.date) - new Date(b.date));

        const futureGigs = gigs.filter(gig => new Date(gig.date) > new Date());

        if (futureGigs.length === 0) {
            gigsContainer.innerHTML = '<p class="modal-subtitle" style="margin:0;text-align:center;">No upcoming gigs scheduled at this time.</p>';
            return;
        }

        const formatDate = (date) => {
            return new Date(date).toLocaleDateString('en-US', {
                month: 'long',
                day: 'numeric',
                year: 'numeric',
                timeZone: 'UTC'
            });
        };

        const gigsHtml = futureGigs.map(gig => `
            <div class="gig-item">
                <div class="gig-venue">${gig.venue}</div>
                <div class="gig-details">
                    <span>${formatDate(gig.date)}</span> · <span>${gig.time}</span>
                </div>
                <a href="${gig.google_maps_url}" target="_blank" class="gig-link">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
                    </svg>
                    View on Map
                </a>
            </div>
        `).join('');

        gigsContainer.innerHTML = gigsHtml;
    } catch (error) {
        console.error('Error loading gigs:', error);
        gigsContainer.innerHTML = '<p style="color:#8B6914;text-align:center;">Error loading gigs. Please try again later.</p>';
    }
};

document.addEventListener('DOMContentLoaded', loadGigs);
