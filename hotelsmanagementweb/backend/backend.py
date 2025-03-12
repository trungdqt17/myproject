import json
from flask import Flask, request, jsonify
from flask_mysqldb import MySQL

# Khai báo ứng dụng Flask
app = Flask(__name__)

# Cấu hình MySQL
app.config["MYSQL_HOST"] = "127.0.0.1"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = "170705"
app.config["MYSQL_DB"] = "dthanh01"

# Khởi tạo MySQL
mysql = MySQL(app)

@app.route('/')
def index():
	return "Hello, World!"

@app.route('/add_data', methods=['POST'])
def add_data():
    data = request.json
    try:
        for hotel in data["hotels"]:
            cursor = mysql.connection.cursor()
            cursor.execute(
                "INSERT INTO hotels (name, location, rating) VALUES (%s, %s, %s)",
                (hotel["hotel_name"], hotel["address"], hotel["rating"])
            )
            hotel_id = cursor.lastrowid

            for room in hotel["rooms"]:
                cursor.execute(
                    "INSERT INTO rooms (hotel_id, room_number, type, price_per_night) VALUES (%s, %s, %s, %s)",
                    (hotel_id, room["id"], room["roomType"], room["price"])
                )
                room_id = cursor.lastrowid

                for service in room["services"]:
                    cursor.execute(
                        "INSERT INTO services (room_id, service_name) VALUES (%s, %s)",
                        (room_id, service)
                    )
            mysql.connection.commit()
            cursor.close()
        return jsonify({"message": "Data imported successfully!"}), 200
    except Exception as e:
        mysql.connection.rollback()
        return jsonify({"error": str(e)}), 500


if __name__ == '__main__':
    app.run(debug=True)

