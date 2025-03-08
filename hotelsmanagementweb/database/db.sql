CREATE TABLE hotels{
    hotel_id INT PRIMARY KEY,
    address_hotel VARCHAR(50),
    tel VARCHAR(10),
    hotel_name VARCHAR(20),
    rating FLOAT,
    descriptions VARCHAR(100)
}

CREATE TABLE rooms{
    room_id INT PRIMARY KEY,
    room_type VARCHAR(10),
    available INT,
    hotel_id INT FOREIGN KEY REFERENCES hotels(hotel_id)
    price BIGINT,
}

CREATE TABLE guests{
    guest_id INT PRIMARY KEY,
    guets_name VARCHAR(25),
    email VARCHAR(20),
    phone VARCHAR(10),
    nationality VARCHAR(15)
}

CREATE TABLE bookings{
    booking_id INT PRIMARY KEY,
    check_in TIMESTAMP,
    check_out TIMESTAMP,
    room_id INT FOREIGN KEY REFERENCES rooms(room_id),
    total_price BIGINT ,
    guest_id INT FOREIGN KEY REFERENCES guests(guest_id),
    payment_status VARCHAR(10) FOREIGN KEY REFERENCES transactions(staus_trans),
    create_at TIMESTAMP
}

CREATE TABLE payment{
    payment_id INT PRIMARY KEY,
    payment_status VARCHAR(10) FOREIGN KEY REFERENCES transactions(staus_trans),
    payment_method ENUM('vnpay', 'momo'),
    amount BIGINT,
    guest_id INT FOREIGN KEY REFERENCES guest(guest_id),
    booking_id INT FOREIGN KEY REFERENCES bookings(booking_id),
    create_at TIMESTAMP,
}

CREATE TABLE reviews{
    review_id INT PRIMARY KEY,
    guest_id INT FOREIGN KEY REFERENCES guests(guest_id),
    rating FLOAT,
    comment VARCHAR(200),
    hotel_id INT FOREIGN KEY REFERENCES hotels(hotel_id)
}

CREATE TABLE services{
    id_service INT PRIMARY KEY,
    serviceName VARCHAR(20),
    room_id INT FOREIGN KEY REFERENCES rooms(room_id)
}

CREATE TABLE transactions{
    transaction_id VARCHAR(10) PRIMARY KEY,
    payment_id INT FOREIGN KEY REFERENCES payment(payment_id),
    provider_trans VARCHAR(20) NOT NULL,
    respanse_message TEXT,
    status_trans ENUM('pending', 'success', 'failed', 'refunded'),
    created_at TIMESTAMP
}