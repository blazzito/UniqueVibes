let elements = {};
let lastNodeData = {};
let activePinnedUI = null;

const Aligns = {
    "top-left": { left: "2vw", top: "2vh", right: "auto", bottom: "auto", transform: "none" },
    "top-right": { right: "2vw", top: "2vh", left: "auto", bottom: "auto", transform: "none" },
    "bottom-left": { left: "2vw", bottom: "2vh", right: "auto", top: "auto", transform: "none" },
    "bottom-right": { right: "2vw", bottom: "2vh", left: "auto", top: "auto", transform: "none" },
    "top-center": { left: "50%", top: "50px", right: "auto", bottom: "auto", transform: "translateX(-50%)" },
    "bottom-center": { left: "50%", bottom: "50px", right: "auto", top: "auto", transform: "translateX(-50%)" },
    "center": { left: "50%", top: "50%", right: "auto", bottom: "auto", transform: "translate(-50%, -50%)" }
};

window.addEventListener('message', function(event) {
    const data = event.data;

    if (data.action === 'textUI') {
        handlePinnedUI(data);
    } else if (data.action === 'show3DText') {
        const node = {
            id: data.id,
            screenX: data.screenX,
            screenY: data.screenY,
            isNear: !!data.isNear,
            key: data.key,
            message: data.text
        };
        handle3DNodes([node]);
    } else if (data.action === 'update3DText') {
        const el = elements[data.id];
        if (el) {
            const node = {
                id: data.id,
                key: data.key,
                message: data.text,
                isNear: true
            };
            updateNodeContent(el, node);
        }
    } else if (data.action === 'updateNodes') {
        handle3DNodes(data.nodes);
    } else if (data.action === 'hide3DText') {
        if (elements[data.id]) {
            elements[data.id].style.opacity = '0';
            setTimeout(() => {
                if (elements[data.id]) {
                    elements[data.id].remove();
                    delete elements[data.id];
                    delete lastNodeData[data.id];
                }
            }, 300);
        }
    } else if (data.action === 'textUIUpdate') {
        handlePinnedUI({ show: true, text: data.text, key: data.key });
    }
});

function handlePinnedUI(data) {
    const container = document.getElementById('ui-container');
    if (!container) return;
    let el = document.getElementById('pinned-ui');

    if (!data.show) {
        if (el) {
            el.style.opacity = '0';
            el.style.transform = (el.dataset.transform || '') + ' scale(0.8)';
            setTimeout(() => { if (el) el.remove(); }, 300);
            activePinnedUI = null;
        }
        return;
    }

    if (!el) {
        el = document.createElement('div');
        el.id = 'pinned-ui';
        el.className = 'textui-node pinned';
        container.appendChild(el);
    }

    const style = Aligns[data.align] || Aligns["top-left"];
    el.style.left = style.left;
    el.style.top = style.top;
    el.style.right = style.right;
    el.style.bottom = style.bottom;
    el.style.transform = style.transform;
    el.dataset.transform = style.transform;

    updateNodeContent(el, {
        id: 'pinned',
        key: data.key,
        message: data.text,
        isNear: true
    });

    el.style.opacity = '1';
}

function handle3DNodes(nodes) {
    const container = document.getElementById('ui-container');
    if (!container) return;
    const currentIds = new Set();

    nodes.forEach(node => {
        currentIds.add(node.id);
        
        let el = elements[node.id];
        if (!el) {
            el = document.createElement('div');
            el.className = 'textui-node world';
            el.id = 'node-' + node.id;
            container.appendChild(el);
            elements[node.id] = el;
        }

        el.style.left = (node.screenX * 100) + '%';
        el.style.top = (node.screenY * 100) + '%';
        
        let scale = 1.0;
        if (node.distance && node.type !== 'textui') {
            scale = Math.max(0.6, 1.0 - (node.distance / 25));
        }
        
        el.style.transform = `translate(-6px, -50%) scale(${scale})`;
        el.style.opacity = '1';

        const nodeDataString = JSON.stringify({
            isNear: node.isNear,
            type: node.type,
            selectedIndex: node.selectedIndex,
            optionsCount: node.options ? node.options.length : 0,
            message: node.message,
            key: node.key,
            id: node.id
        });

        if (lastNodeData[node.id] !== nodeDataString) {
            lastNodeData[node.id] = nodeDataString;
            updateNodeContent(el, node);
        }
    });

    for (let id in elements) {
        if (!currentIds.has(id)) {
            const el = elements[id];
            el.style.opacity = '0';
            setTimeout(() => {
                if (el && el.parentNode) {
                    el.remove();
                    delete elements[id];
                    delete lastNodeData[id];
                }
            }, 300);
        }
    }
}

function updateNodeContent(el, node) {
    const isExpanded = !!node.isNear;
    
    if (!el.querySelector('.node-wrapper')) {
        el.innerHTML = `
            <div class="node-wrapper">
                <div class="dot-indicator"></div>
                <div class="key-cube">${node.key || 'E'}</div>
                <div class="node-content-stack"></div>
            </div>
        `;
    }

    const wrapper = el.querySelector('.node-wrapper');
    const keyCube = el.querySelector('.key-cube');
    const stack = el.querySelector('.node-content-stack');
    
    wrapper.classList.toggle('expanded', isExpanded);

    if (keyCube) keyCube.textContent = node.key || 'E';

    if (node.options && Array.isArray(node.options) && node.options.length > 0) {
        stack.innerHTML = node.options.map((opt, idx) => {
            const isActive = (idx + 1 === (node.selectedIndex || 1));
            const iconHtml = opt.icon ? `<i class="${opt.icon} fa-fw"></i>` : '';
            return `<div class="stack-item ${isActive ? 'active' : 'inactive'}">${iconHtml}${opt.label || 'Opción'}</div>`;
        }).join('');
    } else {
        const iconHtml = "fa-solid fa-hand-pointer fa-fw";
        stack.innerHTML = `<div class="stack-item active"><i class="${iconHtml}"></i>${node.message || "Interacción"}</div>`;
    }
}
