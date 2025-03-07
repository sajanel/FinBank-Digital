from flask import Flask, request, jsonify

app = Flask(__name__)

# Endpoint de login para probar autenticación
users = {"admin": "password123"}

@app.route('/login', methods=['POST'])
def login():
    username = request.json.get('username')
    password = request.json.get('password')
    if users.get(username) == password:
        return jsonify({"message": "Login successful", "token": "123456"}), 200
    return jsonify({"message": "Invalid credentials"}), 401

# Endpoint para realizar una transferencia
@app.route('/transfer', methods=['POST'])
def transfer():
    amount = request.json.get('amount')
    if amount > 1000:
        return jsonify({"message": "Transfer successful"}), 200
    return jsonify({"message": "Insufficient funds"}), 400

if __name__ == '__main__':
    app.run(debug=True)
