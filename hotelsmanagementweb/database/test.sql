-- Create database
CREATE DATABASE IF NOT EXISTS hotel_booking;
USE hotel_booking;

-- Create hotels table
CREATE TABLE IF NOT EXISTS hotels (
    id VARCHAR(10) PRIMARY KEY,
    hotel_name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    rating DECIMAL(2,1) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

-- Create rooms table
CREATE TABLE IF NOT EXISTS rooms (
    id VARCHAR(10) NOT NULL,
    hotel_id VARCHAR(10) NOT NULL,
    room_type VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    available_rooms INT NOT NULL,
    PRIMARY KEY (id, hotel_id),
    FOREIGN KEY (hotel_id) REFERENCES hotels(id) ON DELETE CASCADE
);

-- Create room services table
CREATE TABLE IF NOT EXISTS room_services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    room_id VARCHAR(10) NOT NULL,
    hotel_id VARCHAR(10) NOT NULL,
    service_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (room_id, hotel_id) REFERENCES rooms(id, hotel_id) ON DELETE CASCADE
);

-- Insert data into hotels table
INSERT INTO hotels (id, hotel_name, address, rating, phone_number) VALUES
('HT001', 'Golden Lotus Hotel', '28 Trần Phú, Nha Trang, Khánh Hòa', 4.5, '0258 3812 345'),
('HT002', 'Hanoi Paradise Hotel', '15 Hàng Gai, Hoàn Kiếm, Hà Nội', 4.2, '024 3926 4789'),
('HT003', 'Saigon Emerald Resort', '568 Nguyễn Tất Thành, Quận 4, TP. Hồ Chí Minh', 4.8, '028 3843 9201'),
('HT004', 'Đà Lạt Pine Valley', '42 Đường Trần Hưng Đạo, Phường 10, Đà Lạt', 4.3, '0263 3822 456'),
('HT005', 'Mekong Riverside Hotel', '156 Đường 30/4, Ninh Kiều, Cần Thơ', 4.0, '0292 3819 777'),
('HT006', 'Cát Bà Island Resort', 'Đường Bãi Cát, Cát Bà, Hải Phòng', 4.4, '0225 3887 123'),
('HT007', 'Phú Quốc Pearl Resort', 'Bãi Dài, Gành Dầu, Phú Quốc, Kiên Giang', 4.9, '0297 3981 555'),
('HT008', 'Sapa Mountain View Hotel', '15 Thạch Sơn, Sapa, Lào Cai', 4.1, '0214 3871 234'),
('HT009', 'Hue Royal Palace Hotel', '5 Đường Lê Lợi, Phường Phú Hội, Huế', 4.6, '0234 3822 999'),
('HT010', 'Hội An Riverside Lodge', '28 Nguyễn Du, Phường Minh An, Hội An, Quảng Nam', 4.7, '0235 3926 789');

-- Insert data into rooms table
INSERT INTO rooms (id, hotel_id, room_type, price, available_rooms) VALUES
-- Golden Lotus Hotel
('GL-STD', 'HT001', 'Phòng Tiêu Chuẩn', 850000, 6),
('GL-DLX', 'HT001', 'Phòng Deluxe', 1200000, 4),
('GL-SUT', 'HT001', 'Phòng Suite', 1800000, 8),

-- Hanoi Paradise Hotel
('HP-SUP', 'HT002', 'Phòng Superior', 780000, 3),
('HP-PRE', 'HT002', 'Phòng Premier', 1100000, 7),
('HP-EXC', 'HT002', 'Phòng Executive', 1650000, 5),

-- Saigon Emerald Resort
('SER-GDN', 'HT003', 'Phòng Garden View', 1050000, 8),
('SER-OCN', 'HT003', 'Phòng Ocean View', 1450000, 2),
('SER-VIL', 'HT003', 'Villa Pool Access', 2800000, 4),

-- Đà Lạt Pine Valley
('DPV-STD', 'HT004', 'Phòng Tiêu Chuẩn', 650000, 5),
('DPV-BNG', 'HT004', 'Phòng Bungalow', 1200000, 7),
('DPV-CBIN', 'HT004', 'Cabin Gỗ', 1500000, 3),

-- Mekong Riverside Hotel
('MRH-RIV', 'HT005', 'Phòng River View', 750000, 6),
('MRH-FAM', 'HT005', 'Phòng Gia Đình', 1050000, 8),
('MRH-PENT', 'HT005', 'Penthouse', 1950000, 2),

-- Cát Bà Island Resort
('CB-BUNG', 'HT006', 'Bungalow', 1250000, 3),
('CB-BCHF', 'HT006', 'Beach Front Villa', 2500000, 5),
('CB-OVWT', 'HT006', 'Overwater Bungalow', 3800000, 2),

-- Phú Quốc Pearl Resort
('PQP-DLX', 'HT007', 'Phòng Deluxe', 1450000, 4),
('PQP-PRVP', 'HT007', 'Private Pool Villa', 3200000, 6),
('PQP-PRSV', 'HT007', 'Presidential Villa', 5500000, 1),

-- Sapa Mountain View Hotel
('SMV-STD', 'HT008', 'Phòng Tiêu Chuẩn', 550000, 7),
('SMV-MTN', 'HT008', 'Phòng Mountain View', 850000, 3),
('SMV-HMST', 'HT008', 'Homestay Suite', 1200000, 5),

-- Hue Royal Palace Hotel
('HRP-CLS', 'HT009', 'Phòng Classic', 890000, 4),
('HRP-IMP', 'HT009', 'Phòng Imperial', 1350000, 8),
('HRP-KING', 'HT009', 'King\'s Chamber', 2200000, 3),

-- Hội An Riverside Lodge
('HAR-TRD', 'HT010', 'Phòng Truyền Thống', 950000, 6),
('HAR-RVST', 'HT010', 'Phòng Riverside Studio', 1400000, 5),
('HAR-LNTN', 'HT010', 'Lantern Suite', 1900000, 2);

-- Insert data into room_services table
-- Golden Lotus Hotel - GL-STD
INSERT INTO room_services (room_id, hotel_id, service_name) VALUES
('GL-STD', 'HT001', 'Wi-Fi miễn phí'),
('GL-STD', 'HT001', 'Máy lạnh'),
('GL-STD', 'HT001', 'TV LED'),
('GL-STD', 'HT001', 'Minibar'),
('GL-STD', 'HT001', 'Bữa sáng miễn phí');

-- Golden Lotus Hotel - GL-DLX
INSERT INTO room_services (room_id, hotel_id, service_name) VALUES
('GL-DLX', 'HT001', 'Wi-Fi miễn phí'),
('GL-DLX', 'HT001', 'Máy lạnh'),
('GL-DLX', 'HT001', 'TV LED'),
('GL-DLX', 'HT001', 'Minibar'),
('GL-DLX', 'HT001', 'Bữa sáng miễn phí'),
('GL-DLX', 'HT001', 'Ban công view biển');

-- Golden Lotus Hotel - GL-SUT
INSERT INTO room_services (room_id, hotel_id, service_name) VALUES
('GL-SUT', 'HT001', 'Wi-Fi miễn phí'),
('GL-SUT', 'HT001', 'Máy lạnh'),
('GL-SUT', 'HT001', 'TV LED'),
('GL-SUT', 'HT001', 'Minibar'),
('GL-SUT', 'HT001', 'Bữa sáng miễn phí'),
('GL-SUT', 'HT001', 'Ban công view biển'),
('GL-SUT', 'HT001', 'Phòng khách riêng'),
('GL-SUT', 'HT001', 'Bồn tắm spa');

-- Hanoi Paradise Hotel - HP-SUP
INSERT INTO room_services (room_id, hotel_id, service_name) VALUES
('HP-SUP', 'HT002', 'Wi-Fi miễn phí'),
('HP-SUP', 'HT002', 'Máy lạnh'),
('HP-SUP', 'HT002', 'TV LED'),
('HP-SUP', 'HT002', 'Minibar'),
('HP-SUP', 'HT002', 'Bữa sáng miễn phí');

-- Continue for all other rooms...
-- For brevity, I've included just a few examples of service insertions
-- In a real implementation, you would add all services for all rooms

-- Create stored procedures for common operations
DELIMITER //

-- Get hotel by ID with its rooms
CREATE PROCEDURE GetHotelWithRooms(IN hotelId VARCHAR(10))
BEGIN
    SELECT h.*, r.id AS room_id, r.room_type, r.price, r.available_rooms
    FROM hotels h
    JOIN rooms r ON h.id = r.hotel_id
    WHERE h.id = hotelId;
    
    SELECT rs.service_name
    FROM room_services rs
    WHERE rs.hotel_id = hotelId
    ORDER BY rs.room_id;
END //

-- Get available rooms by price range
CREATE PROCEDURE GetRoomsByPriceRange(IN minPrice DECIMAL(10,2), IN maxPrice DECIMAL(10,2))
BEGIN
    SELECT h.id AS hotel_id, h.hotel_name, h.address, h.rating, 
           r.id AS room_id, r.room_type, r.price, r.available_rooms
    FROM hotels h
    JOIN rooms r ON h.id = r.hotel_id
    WHERE r.price BETWEEN minPrice AND maxPrice
    ORDER BY r.price;
END //

-- Search hotels by name
CREATE PROCEDURE SearchHotels(IN searchTerm VARCHAR(100))
BEGIN
    SELECT * FROM hotels
    WHERE hotel_name LIKE CONCAT('%', searchTerm, '%')
    ORDER BY rating DESC;
END //

-- Book a room
CREATE PROCEDURE BookRoom(
    IN hotelId VARCHAR(10),
    IN roomId VARCHAR(10),
    IN numberOfRooms INT,
    OUT success BOOLEAN,
    OUT message VARCHAR(255)
)
BEGIN
    DECLARE available INT;
    
    -- Check if room exists and has enough availability
    SELECT available_rooms INTO available
    FROM rooms
    WHERE id = roomId AND hotel_id = hotelId;
    
    IF available IS NULL THEN
        SET success = FALSE;
        SET message = 'Room not found';
    ELSEIF available < numberOfRooms THEN
        SET success = FALSE;
        SET message = 'Not enough rooms available';
    ELSE
        -- Update available rooms
        UPDATE rooms
        SET available_rooms = available_rooms - numberOfRooms
        WHERE id = roomId AND hotel_id = hotelId;
        
        SET success = TRUE;
        SET message = 'Booking successful';
    END IF;
END //

DELIMITER ;