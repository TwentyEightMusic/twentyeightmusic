const loadGigs = async () => {
    const gigsContainer = document.querySelector('.gigs-list');
    if (!gigsContainer) return;

    try {
        const response = await fetch('data/gigs.json');
        const gigs = await response.json();

        gigs.sort((a, b) => new Date(a.date) - new Date(b.date));

        const futureGigs = gigs.filter(gig => new Date(gig.date) > new Date());

        if (futureGigs.length === 0) {
            gigsContainer.innerHTML = '<p class="text-gray-600">No upcoming gigs scheduled at this time.</p>';
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
            <div class="gig-item p-4 mb-4 border rounded-lg hover:bg-gray-50 transition-colors">
                <div class="font-semibold">${gig.venue}</div>
                <div class="text-sm text-gray-600">
                    <span class="mr-2">${formatDate(gig.date)}</span>
                    <span>${gig.time}</span>
                </div>
                <a href="${gig.google_maps_url}" target="_blank" class="text-blue-600 hover:text-blue-800 mt-2 inline-block text-sm">View on Google Maps</a>
            </div>
        `).join('');

        gigsContainer.innerHTML = gigsHtml;
    } catch (error) {
        console.error('Error loading gigs:', error);
        gigsContainer.innerHTML = '<p class="text-red-600">Error loading gigs. Please try again later.</p>';
    }
};

document.addEventListener('DOMContentLoaded', loadGigs);
