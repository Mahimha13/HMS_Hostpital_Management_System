from flask import Flask, render_template, request, jsonify
import mysql.connector

app = Flask(__name__)

# MySQL connection
db = mysql.connector.connect(
    host="localhost",
    user="root",          # your MySQL username
    password="yourpassword",  # your MySQL password
    database="hms"
)
cur = db.cursor(dictionary=True)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/search_patient')
def search_patient():
    return render_template('search_patient.html')

@app.route('/api/search', methods=['GET'])
def api_search():
    key = request.args.get('key', '').lower()
    dept = request.args.get('dept', '')
    query = "SELECT * FROM patients WHERE (LOWER(name) LIKE %s OR LOWER(patient_id) LIKE %s)"
    params = [f"%{key}%", f"%{key}%"]

    if dept:
        query += " AND department = %s"
        params.append(dept)

    cur.execute(query, params)
    data = cur.fetchall()
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True)
