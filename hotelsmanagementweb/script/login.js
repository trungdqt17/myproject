const loginForm = document.querySelector("#login-form");

loginForm.addEventListener("submit", (e) => {
	e.preventDefault();
	const username = loginForm.username.value;
	const password = loginForm.password.value;
	
	handleLogin(username, password);
});

async function handleLogin(username, password) { 
	console.log('login', username, password);
	
	const { token } = await fetch('https://reqres.in/api/login', {
		method: 'POST',
		headers: { 'Content-Type': 'application/json' },
		body: JSON.stringify({
			email: 'eve.holt@reqres.in',
			password: 'cityslicka',
		}),
	})
	.then(res => res.json())

	if (token) {
		//TODO: redirect to booking page
	}
}