const fs = require('fs');

// 1. Modificar HTML
let html = fs.readFileSync('d:/Programacion/Uniquevibes/mt-hud/ui/dist/index.html', 'utf8');

// Extraer contenidos
let carControlsMatch = html.match(/<div id="car-controls-dashboard">([\s\S]*?)<\/div>\s*<!-- RADIO DASHBOARD INTEGRATION -->/);
let radioContentMatch = html.match(/<div id="radio-dashboard" class="radio-dashboard">([\s\S]*?)<\/div>\s*<\/div>\s*<\/div>\s*<div id="screen-fade">/);

if (carControlsMatch && radioContentMatch) {
    let newUnified = `
            <!-- UNIFIED DASHBOARD -->
            <div id="unified-dashboard" class="hidden-dashboard">
                <div class="dashboard-section" id="section-car-controls">
                    <div class="section-header"><i class="fas fa-car"></i> Controles de Vehículo</div>
                    <div id="car-controls-content">
                        ${carControlsMatch[1]}
                    </div>
                </div>

                <div class="dashboard-section" id="section-radio">
                    <div class="section-header"><i class="fas fa-music"></i> Sistema de Audio</div>
                    <div id="radio-dashboard-content">
                        ${radioContentMatch[1].replace(/<!-- Circular Volume Control -->[\s\S]*?<\/div>/, '')}
                    </div>
                </div>
            </div>
`;
    // Insert the volume knob inside thumbnail container
    let volKnobHtml = `
                            <!-- Circular Volume Control -->
                            <div class="volume-knob" id="volumeKnob" title="Arrastra hacia arriba/abajo para ajustar">
                                <svg viewBox="0 0 36 36" class="circular-chart">
                                    <path class="circle-bg"
                                      d="M18 2.0845
                                        a 15.9155 15.9155 0 0 1 0 31.831
                                        a 15.9155 15.9155 0 0 1 0 -31.831"
                                    />
                                    <path class="circle-progress" id="volumeProgress"
                                      stroke-dasharray="50, 100"
                                      d="M18 2.0845
                                        a 15.9155 15.9155 0 0 1 0 31.831
                                        a 15.9155 15.9155 0 0 1 0 -31.831"
                                    />
                                </svg>
                                <span id="volumeText">50%</span>
                            </div>`;

    newUnified = newUnified.replace('alt="Thumbnail">', 'alt="Thumbnail">\n' + volKnobHtml);

    // Remove old car controls and radio
    html = html.replace(carControlsMatch[0], '');
    html = html.replace(radioContentMatch[0], newUnified + '\n        </div>\n    </div>\n    <div id="screen-fade">');
    
    fs.writeFileSync('d:/Programacion/Uniquevibes/mt-hud/ui/dist/index.html', html, 'utf8');
    console.log('HTML updated successfully.');
} else {
    console.log('Could not find matches for HTML replacement.');
}
