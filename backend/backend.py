import json
import mysql.connector

# Kết nối MySQL
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="password",
    database="hotel_db"
)
cursor = conn.cursor()

# Đọc file JSON
with open("hotels.json", "r", encoding="utf-8") as file:
    data = json.load(file)

# Chèn dữ liệu vào MySQL
for hotel in data["hotels"]:
    cursor.execute(
        "INSERT INTO hotels (name, location, rating) VALUES (%s, %s, %s)",
        (hotel["name"], hotel["location"], hotel["rating"])
    )
    hotel_id = cursor.lastrowid  # Lấy ID khách sạn vừa thêm

    for room in hotel["rooms"]:
        cursor.execute(
            "INSERT INTO rooms (hotel_id, room_number, type, price_per_night) VALUES (%s, %s, %s, %s)",
            (hotel_id, room["room_number"], room["type"], room["price_per_night"])
        )
        room_id = cursor.lastrowid  # Lấy ID phòng vừa thêm

        for service in room["services"]:
            cursor.execute(
                "INSERT INTO services (room_id, service_name) VALUES (%s, %s)",
                (room_id, service)
            )

# Commit và đóng kết nối
conn.commit()
cursor.close()
conn.close()
print("Data imported successfully!")
