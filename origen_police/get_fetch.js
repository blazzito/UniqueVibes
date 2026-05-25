const fs = require('fs');
const content = fs.readFileSync('html/admin-dist/admin.js', 'utf8');
const regex = /fetch\(['"`]https:\/\/origen_police\/op_admin_(?:add|remove)Radio(?:Category|Channel|Cats|Channels)['"`].*?body:\s*JSON\.stringify\((.*?)\)/gs;
let match;
while ((match = regex.exec(content)) !== null) {
    console.log(match[0]);
}
