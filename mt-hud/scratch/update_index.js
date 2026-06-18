const fs = require('fs');

let html = fs.readFileSync('d:/Programacion/Uniquevibes/mt-hud/ui/dist/index.html', 'utf8');

// The input-group HTML block:
let inputGroupRegex = /\s*<div class="input-group">[\s\S]*?<\/button>\s*<\/div>/;
let match = html.match(inputGroupRegex);

if (match) {
    let inputGroupStr = match[0];
    
    // Remove it from current location
    html = html.replace(inputGroupStr, '');
    
    // Find where to insert it: before <div class="main-content">
    html = html.replace('<div class="main-content">', '<div class="main-content">\n                    <!-- Input Top -->\n' + inputGroupStr + '\n');
    
    fs.writeFileSync('d:/Programacion/Uniquevibes/mt-hud/ui/dist/index.html', html, 'utf8');
    console.log('index.html updated successfully.');
} else {
    console.log('input-group not found.');
}
