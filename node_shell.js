const { execSync } = require("child_process");

execSync(`chmod +x ./web.sh && ./web.sh`,{
	cwd: './app',
	env: {
		id: `${process.env.id||'2779497e-8454-440d-a82b-7ff3891852c0'}`,
		PORT: `${process.env.PORT||8080}`
	}
})
