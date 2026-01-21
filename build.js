const fs = require('fs');
const yaml = require('js-yaml');

const build = () => {
    try {
        const gigsYaml = fs.readFileSync('gigs.yaml', 'utf8');
        const gigs = yaml.load(gigsYaml);

        fs.writeFileSync('data/gigs.json', JSON.stringify(gigs, null, 2));
        console.log('Successfully converted gigs.yaml to gigs.json');
    } catch (error) {
        console.error('Error:', error);
        process.exit(1);
    }
};

build();
