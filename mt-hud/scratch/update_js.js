const fs = require('fs');
let js = fs.readFileSync('d:/Programacion/Uniquevibes/mt-hud/ui/dist/script.js', 'utf8');

js = js.replace(/postToLua\('savePlaylist', \{ name: name, queue: currentRadioState\.queue \}\);/g, 
`if (!currentRadioState || !currentRadioState.queue || currentRadioState.queue.length === 0) {
            console.log('No hay canciones en la cola para guardar.');
            return;
        }
        postToLua('savePlaylist', { name: name, queue: currentRadioState.queue });`);

fs.writeFileSync('d:/Programacion/Uniquevibes/mt-hud/ui/dist/script.js', js, 'utf8');
console.log('script.js updated.');
