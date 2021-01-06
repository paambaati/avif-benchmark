const fs = require('fs');
const sharp = require('sharp');
const quality = 90;

const args = process.argv;
if (args.length !== 4) {
    console.error('Usage: node convert.js <filepath> <avif/webp>');
    console.error('')
    process.exit(1);
}

const FILEPATH = args[2];
const FORMAT = args[3];

(async () => {
    const upstreamBuffer = fs.readFileSync(FILEPATH);
    const transformer = sharp(upstreamBuffer);

    transformer.rotate(); // Auto-rotate based on EXIF data
    await transformer.metadata(); // Read metadata once because Next.js image optimizer does.

    const startConversion = process.hrtime();
    transformer[FORMAT]({ quality });
    const endConversion = process.hrtime(startConversion);
    const millisecondsTaken = (endConversion[0] * 1e9 + endConversion[1]) / 1e6;
    console.log(millisecondsTaken);    
})();
