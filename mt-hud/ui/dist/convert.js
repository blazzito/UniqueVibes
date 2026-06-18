const fs = require('fs');
let code = fs.readFileSync('d:/Programacion/Uniquevibes/mt-hud/ui/dist/script.js', 'utf8');

// Convert jQuery events to Vanilla JS
code = code.replace(/\$\("#addBtn"\)\.click\(function\(\) \{/g, 'document.getElementById("addBtn").addEventListener("click", function() {');
code = code.replace(/\$\("#urlInput"\)\.keypress\(function\(e\) \{/g, 'document.getElementById("urlInput").addEventListener("keypress", function(e) {');
code = code.replace(/\$\("#playPauseBtn"\)\.click\(function\(\) \{/g, 'document.getElementById("playPauseBtn").addEventListener("click", function() {');
code = code.replace(/\$\("#nextBtn"\)\.click\(function\(\) \{/g, 'document.getElementById("nextBtn").addEventListener("click", function() {');
code = code.replace(/\$\("#prevBtn"\)\.click\(function\(\) \{/g, 'document.getElementById("prevBtn").addEventListener("click", function() {');
code = code.replace(/\$\("#stopBtn"\)\.click\(function\(\) \{/g, 'document.getElementById("stopBtn").addEventListener("click", function() {');
code = code.replace(/\$\("#loopBtn"\)\.click\(function\(\) \{/g, 'document.getElementById("loopBtn").addEventListener("click", function() {');
code = code.replace(/\$\("#volumeKnob"\)\.on\("mousedown", function\(e\) \{/g, 'document.getElementById("volumeKnob").addEventListener("mousedown", function(e) {');
code = code.replace(/\$\(document\)\.on\("mousemove", function\(e\) \{/g, 'document.addEventListener("mousemove", function(e) {');
code = code.replace(/\$\(document\)\.on\("mouseup", function\(\) \{/g, 'document.addEventListener("mouseup", function() {');
code = code.replace(/\$\("#savePlaylistBtn"\)\.click\(function\(\) \{/g, 'document.getElementById("savePlaylistBtn").addEventListener("click", function() {');

// Value operations
code = code.replace(/\$\("#volumeText"\)\.text\(\)/g, '(document.getElementById("volumeText").innerText)');
code = code.replace(/\$\("#volumeText"\)\.text\((.*?)\)/g, 'document.getElementById("volumeText").innerText = $1');
code = code.replace(/\$\("#urlInput"\)\.val\(""\)/g, 'document.getElementById("urlInput").value = ""');
code = code.replace(/\$\("#urlInput"\)\.val\(\)/g, 'document.getElementById("urlInput").value');
code = code.replace(/\$\("#playlistName"\)\.val\(""\)/g, 'document.getElementById("playlistName").value = ""');
code = code.replace(/\$\("#playlistName"\)\.val\(\)/g, 'document.getElementById("playlistName").value');
code = code.replace(/\$\("#queueList"\)\.html\((.*?)\)/g, 'document.getElementById("queueList").innerHTML = $1');
code = code.replace(/\$\("#playlistsList"\)\.html\((.*?)\)/g, 'document.getElementById("playlistsList").innerHTML = $1');

// Class operations
code = code.replace(/\$\("#playPauseIcon"\)\.removeClass\("fa-pause"\)\.addClass\("fa-play"\)/g, 'document.getElementById("playPauseIcon").classList.remove("fa-pause"); document.getElementById("playPauseIcon").classList.add("fa-play")');
code = code.replace(/\$\("#playPauseIcon"\)\.removeClass\("fa-play"\)\.addClass\("fa-pause"\)/g, 'document.getElementById("playPauseIcon").classList.remove("fa-play"); document.getElementById("playPauseIcon").classList.add("fa-pause")');
code = code.replace(/\$\("#visualizer"\)\.removeClass\("active"\)/g, 'document.getElementById("visualizer").classList.remove("active")');
code = code.replace(/\$\("#visualizer"\)\.addClass\("active"\)/g, 'document.getElementById("visualizer").classList.add("active")');
code = code.replace(/\$\("#loopBtn"\)\.removeClass\("active-loop"\)/g, 'document.getElementById("loopBtn").classList.remove("active-loop")');
code = code.replace(/\$\("#loopBtn"\)\.addClass\("active-loop"\)/g, 'document.getElementById("loopBtn").classList.add("active-loop")');
code = code.replace(/\$\("#trackTitle"\)\.removeClass\("scrolling"\)/g, 'document.getElementById("trackTitle").classList.remove("scrolling")');
code = code.replace(/\$\("#trackTitle"\)\.addClass\("scrolling"\)/g, 'document.getElementById("trackTitle").classList.add("scrolling")');
code = code.replace(/\$\("#trackTitle"\)\.width\(\)/g, 'document.getElementById("trackTitle").offsetWidth');
code = code.replace(/\$\("\.track-title-container"\)\.width\(\)/g, 'document.querySelector(".track-title-container").offsetWidth');

// Attr and Text
code = code.replace(/\$\("#thumbnailImg"\)\.attr\("src", (.*?)\)/g, 'document.getElementById("thumbnailImg").src = $1');
code = code.replace(/\$\("#trackTitle"\)\.text\((.*?)\)/g, 'document.getElementById("trackTitle").innerText = $1');
code = code.replace(/\$\("#volumeProgress"\)\.attr\("stroke-dasharray", `\$\{vol\}, 100`\)/g, 'document.getElementById("volumeProgress").setAttribute("stroke-dasharray", `${vol}, 100`)');

// Post
code = code.replace(/\$\.post\(`https:\/\/\$\{GetParentResourceName\(\)\}\/(.*?)`, JSON\.stringify\((.*?)\)\);/g, 'fetch(`https://${GetParentResourceName()}/$1`, { method: "POST", body: JSON.stringify($2) }).catch(() => {});');

fs.writeFileSync('d:/Programacion/Uniquevibes/mt-hud/ui/dist/script.js', code);
