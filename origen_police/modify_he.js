const fs = require('fs');
let content = fs.readFileSync('html/admin-dist/admin.js', 'utf8');

const search = 'async function he(v,l={}){try{return await(await fetch(`https://origen_police/${v}`,{method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify(l)})).json()}catch(m){return console.error("Error on NUI Callback:",m),!1}}';
const replacement = 'async function he(v,l={}){try{let res=await fetch(`https://origen_police/${v}`,{method:"POST",headers:{"Content-Type":"application/json"},body:JSON.stringify(l)});let text=await res.text();console.log("Raw fetch response for "+v+":", text);return JSON.parse(text);}catch(m){console.error("Error on NUI Callback for "+v+":", m);return !1;}}';

if (content.includes(search)) {
    content = content.replace(search, replacement);
    fs.writeFileSync('html/admin-dist/admin.js', content);
    console.log("Replaced he function");
} else {
    console.log("Could not find he function in admin.js");
}
