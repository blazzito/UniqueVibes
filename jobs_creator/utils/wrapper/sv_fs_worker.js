const {parentPort} = require('worker_threads')
const fs = require('fs')

const ops = {
	writeFile(args) {
		fs.writeFileSync(args.path, args.data, args.encoding || 'utf8')
	}
}

parentPort.on('message', (msg) => {
	const {op, args, signal} = msg
	const view = new Int32Array(signal)

	try {
		const handler = ops[op]
		if (!handler) throw new Error(`Unknown op: ${op}`)
		handler(args)
		Atomics.store(view, 0, 1)
	} catch(e) {
		console.error(`[fs-worker] ${op} error:`, e.message)
		Atomics.store(view, 0, -1)
	}

	Atomics.notify(view, 0)
})
