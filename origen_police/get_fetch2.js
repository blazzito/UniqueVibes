const fs = require('fs');
const content = fs.readFileSync('html/admin-dist/admin.js', 'utf8');
const index = content.indexOf('op_admin_addRadioCategory');
if (index !== -1) {
    console.log(content.substring(Math.max(0, index - 100), index + 200));
}

const index2 = content.indexOf('op_admin_removeRadioCategory');
if (index2 !== -1) {
    console.log(content.substring(Math.max(0, index2 - 100), index2 + 200));
}

const index3 = content.indexOf('op_admin_addRadioChannel');
if (index3 !== -1) {
    console.log(content.substring(Math.max(0, index3 - 100), index3 + 200));
}

const index4 = content.indexOf('op_admin_removeRadioChannel');
if (index4 !== -1) {
    console.log(content.substring(Math.max(0, index4 - 100), index4 + 200));
}
