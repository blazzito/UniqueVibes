const fs = require('fs').promises;
const path = require('path');

let playerDatabase = {};

async function loadPlayerDatabase(overrideDir, key) {
    // try {
    //     overrideDir = overrideDir == "" ? null : overrideDir;
    //     const dataDir = path.join(overrideDir || process.cwd(), 'txData', 'default', 'data', 'playersDB.json');
    //     const data = await fs.readFile(dataDir, 'utf8');
    //     const jsonData = JSON.parse(data);
    //     if(key == "*") return jsonData;
    //     return jsonData[key] || null;
    // } catch (error) {
    //     console.log("Can't load player database:", error);
    //     return [];
    // }
    return [];
}

global.exports("LoadPlayerDatabase", loadPlayerDatabase);