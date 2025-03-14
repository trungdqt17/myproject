const bookingsTableBodyEl = document.getElementById('bookings-list');
const bookings = [
  {
    id: "B001",
    guestName: "Alex Johnson",
    roomType: "Deluxe Suite",
    checkIn: "2023-03-20",
    checkOut: "2023-03-25",
    status: "Confirmed",
    amount: "$750.00",
  },
  {
    id: "B002",
    guestName: "Sarah Williams",
    roomType: "Standard Room",
    checkIn: "2023-03-18",
    checkOut: "2023-03-21",
    status: "Checked In",
    amount: "$320.00",
  },
]

function renderBookings(bookings) {
	const tableRow = document.createElement('tr');

	for (let i = 0; i < bookings.length; i++) {
		const row = tableRow.cloneNode(true);
		const booking = bookings[i];
		row.innerHTML = `
			<td>${booking.id}</td>
			<td>${booking.guestName}</td>
			<td>${booking.roomType}</td>
			<td>${booking.checkIn}</td>
			<td>${booking.checkOut}</td>
			<td>${booking.status}</td>
			<td>${booking.amount}</td>
		`;
		bookingsTableBodyEl.appendChild(row);
	}
}

async function getBookings() {
	const bookings = await fetch('https://jsonplaceholder.typicode.com/posts?_limit=10').then(res => res.json());
		console.log('bookings', bookings);
		
	return bookings.map(booking => ({
		id: `${booking.id}`,
    guestName: "Alex Johnson",
    roomType: "Deluxe Suite",
    checkIn: "2023-03-20",
    checkOut: "2023-03-25",
    status: "Confirmed",
    amount: "$750.00",
	}));
}

window.onload = async function () {
	const bookings = await getBookings();
	renderBookings(bookings);
}