const fs = require('fs');
let css = fs.readFileSync('d:/Programacion/Uniquevibes/mt-hud/ui/dist/style.css', 'utf8');

// 1. Remove `#car-hud.show-controls { bottom: 20vh; }`
css = css.replace(/#car-hud\.show-controls\s*\{\s*bottom:\s*20vh;\s*\/\*\s*Se eleva para mostrar los controles\s*\*\/\s*\}/g, '');

// 2. Remove old dashboard toggle rules
css = css.replace(/#car-hud\.show-controls #car-controls-dashboard\s*\{\s*opacity:\s*1;\s*pointer-events:\s*auto;\s*\}/g, '');
css = css.replace(/#car-hud\.show-controls #radio-dashboard\s*\{\s*display:\s*flex;\s*opacity:\s*1;\s*pointer-events:\s*auto;\s*\}/g, '');

// 3. Remove old car-controls-dashboard positioning
css = css.replace(/#car-controls-dashboard\s*\{[\s\S]*?\}/, '');

// 4. Remove old radio-dashboard positioning
css = css.replace(/#radio-dashboard\s*\{[\s\S]*?\}/, '');

// 5. Add new Unified Dashboard CSS
const newCss = `
/* UNIFIED DASHBOARD */
#unified-dashboard {
    position: absolute;
    bottom: 120%; /* Right above the speedometer */
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    flex-direction: column;
    gap: 1.5vh;
    background: rgba(15, 15, 18, 0.85);
    border: 1px solid rgba(255, 255, 255, 0.08);
    border-top: 3px solid #ff6b00;
    border-radius: 1.5vh;
    padding: 2.5vh;
    box-shadow: 0 1vh 4vh rgba(0,0,0,0.8);
    width: 65vh; /* Fixed width for the unified UI */
    opacity: 0;
    pointer-events: none;
    transition: opacity 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94), transform 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

#car-hud.show-controls #unified-dashboard {
    opacity: 1;
    pointer-events: auto;
}

.dashboard-section {
    display: flex;
    flex-direction: column;
    gap: 1vh;
}

.section-header {
    font-family: 'Bebas Neue', sans-serif;
    font-size: 2vh;
    color: #ff6b00;
    text-shadow: 0 0.2vh 0.5vh rgba(0,0,0,0.5);
    letter-spacing: 0.1vh;
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    padding-bottom: 0.5vh;
    margin-bottom: 0.5vh;
}

#car-controls-content {
    display: flex;
    flex-direction: column;
    gap: 1vh;
}

#radio-dashboard-content {
    display: flex;
    flex-direction: column;
    gap: 1vh;
}

/* Adjust volume knob for thumbnail overlay */
.thumbnail-container {
    position: relative;
}

.volume-knob {
    position: absolute;
    bottom: 0.5vh;
    right: 0.5vh;
    width: 5vh;
    height: 5vh;
    background: rgba(0,0,0,0.7);
    backdrop-filter: blur(5px);
    border: 1px solid rgba(255, 255, 255, 0.1);
    box-shadow: 0 0.5vh 1vh rgba(0,0,0,0.5);
    z-index: 10;
}
.volume-knob span {
    font-size: 1.1vh;
}
`;

css += newCss;
fs.writeFileSync('d:/Programacion/Uniquevibes/mt-hud/ui/dist/style.css', css, 'utf8');
console.log('CSS updated successfully.');
