const fs = require('fs');
const yaml = require('js-yaml');

try {
    const gigsYaml = fs.readFileSync('gigs.yaml', 'utf8');
    const gigs = yaml.load(gigsYaml);
    
    // Write to JSON file
    fs.writeFileSync('data/gigs.json', JSON.stringify(gigs, null, 2));
    console.log('Successfully converted gigs.yaml to gigs.json');
} catch (error) {
    console.error('Error:', error);
}
