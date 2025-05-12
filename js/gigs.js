async function loadGigs() {
    try {
        const response = await fetch('data/gigs.json');
        const gigs = await response.json();
        
        // Sort gigs by date in ascending order
        gigs.sort((a, b) => new Date(a.date) - new Date(b.date));
        
        // Filter out past gigs
        const futureGigs = gigs.filter(gig => new Date(gig.date) > new Date());
        
        const gigsContainer = document.querySelector('.gigs-list');
        if (!gigsContainer) return;
        
        if (futureGigs.length === 0) {
            gigsContainer.innerHTML = '<p class="text-gray-600">No upcoming gigs scheduled at this time.</p>';
            return;
        }
        
        const gigsHtml = futureGigs.map(gig => `
            <div class="gig-item p-4 mb-4 border rounded-lg hover:bg-gray-50 transition-colors">
                <div class="font-semibold">${gig.venue}</div>
                <div class="text-sm text-gray-600">
                    <span class="mr-2">${new Date(gig.date).toLocaleDateString('en-US', { month: 'long', day: 'numeric', year: 'numeric' })}</span>
                    <span>${new Date(gig.date).toLocaleTimeString('en-US', { hour: 'numeric', minute: '2-digit', hour12: true }).replace(/^(\d+):/g, gig.time.split(':')[0] + ':')}</span>
                </div>
                <a href="${gig.google_maps_url}" target="_blank" class="text-blue-600 hover:text-blue-800 mt-2 inline-block text-sm">View on Google Maps</a>
            </div>
        `).join('');
        
        gigsContainer.innerHTML = gigsHtml;
    } catch (error) {
        console.error('Error loading gigs:', error);
        const gigsContainer = document.querySelector('.gigs-list');
        if (gigsContainer) {
            gigsContainer.innerHTML = '<p class="text-red-600">Error loading gigs. Please try again later.</p>';
        }
    }
}

// Initialize gigs when the page loads
document.addEventListener('DOMContentLoaded', () => {
    loadGigs();
});
