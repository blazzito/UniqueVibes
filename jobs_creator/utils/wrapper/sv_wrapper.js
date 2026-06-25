const fs = require('fs')

exports('SaveResourceFile', (filePath, data) => {
	if (!filePath || !data) return false
	
	try {
		fs.writeFileSync(filePath, data, 'utf8')
		return true
	} catch(e) {
		console.error(`[jobs_creator] SaveResourceFile error:`, e.message)
		return false
	}
})
