USE dthanh01;
CREATE TABLE hotels (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    rating FLOAT
);

CREATE TABLE rooms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_id INT,
    room_number INT NOT NULL,
    type VARCHAR(100) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (hotel_id) REFERENCES hotels(id)
);
CREATE TABLE services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    room_id INT,
    service_name VARCHAR(255),
    FOREIGN KEY (room_id) REFERENCES rooms(id)
);
