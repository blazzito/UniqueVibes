const fs = require('fs');
const content = fs.readFileSync('html/admin-dist/admin.js', 'utf8');

const index = content.indexOf('op_admin_reorderRadioCats');
if (index !== -1) {
    console.log("CATS:", content.substring(Math.max(0, index - 100), index + 200));
}

const index2 = content.indexOf('op_admin_reorderRadioChannels');
if (index2 !== -1) {
    console.log("CHANNELS:", content.substring(Math.max(0, index2 - 100), index2 + 200));
}
