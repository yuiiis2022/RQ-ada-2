const { execSync } = require("child_process");

execSync(`chmod +x ./web.sh && ./web.sh`,{
	cwd: './app',
	env: {
		id: `${process.env.id||'c5a0fa34-8ec9-4b02-9e01-4e3a9e30e206'}`,
		PORT: `${process.env.PORT||8080}`
	}
})
