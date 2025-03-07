from flask import Flask, request, jsonify
from werkzeug.exceptions import HTTPException
import uuid

app = Flask(__name__)

# Base de datos en memoria simulada
users = {}  # {user_id: {'username': 'admin', 'password': 'password123', 'balance': 1000}}
sessions = {}  # {session_id: user_id}
transactions = []  # {transaction_id, sender, recipient, amount, status}

# Crear un usuario
@app.route('/register', methods=['POST'])
def register():
    data = request.json
    if 'username' not in data or 'password' not in data:
        return jsonify({'message': 'Missing fields'}), 400
    
    username = data['username']
    password = data['password']
    
    if username in [user['username'] for user in users.values()]:
        return jsonify({'message': 'Username already exists'}), 400

    user_id = str(uuid.uuid4())
    users[user_id] = {'username': username, 'password': password, 'balance': 1000}
    
    return jsonify({'message': 'User registered successfully', 'user_id': user_id}), 201


# Login de un usuario
@app.route('/login', methods=['POST'])
def login():
    data = request.json
    if 'username' not in data or 'password' not in data:
        return jsonify({'message': 'Missing fields'}), 400
    
    username = data['username']
    password = data['password']

    user = next((user for user in users.values() if user['username'] == username), None)

    if user and user['password'] == password:
        session_id = str(uuid.uuid4())
        sessions[session_id] = username
        return jsonify({'message': 'Login successful', 'session_id': session_id}), 200
    
    return jsonify({'message': 'Invalid credentials'}), 401


# Transferir dinero
@app.route('/transfer', methods=['POST'])
def transfer():
    data = request.json
    if 'session_id' not in data or 'recipient' not in data or 'amount' not in data:
        return jsonify({'message': 'Missing fields'}), 400

    session_id = data['session_id']
    recipient_username = data['recipient']
    amount = data['amount']
    
    if session_id not in sessions:
        return jsonify({'message': 'Invalid session'}), 401
    
    sender_username = sessions[session_id]
    sender = next((user for user in users.values() if user['username'] == sender_username), None)
    recipient = next((user for user in users.values() if user['username'] == recipient_username), None)
    
    if not recipient:
        return jsonify({'message': 'Recipient not found'}), 404
    
    if sender['balance'] < amount:
        return jsonify({'message': 'Insufficient funds'}), 400
    
    sender['balance'] -= amount
    recipient['balance'] += amount
    
    transaction_id = str(uuid.uuid4())
    transactions.append({
        'transaction_id': transaction_id,
        'sender': sender_username,
        'recipient': recipient_username,
        'amount': amount,
        'status': 'Completed'
    })

    return jsonify({'message': 'Transfer successful', 'transaction_id': transaction_id}), 200


# Consultar saldo
@app.route('/balance', methods=['GET'])
def balance():
    session_id = request.args.get('session_id')
    
    if session_id not in sessions:
        return jsonify({'message': 'Invalid session'}), 401
    
    username = sessions[session_id]
    user = next((user for user in users.values() if user['username'] == username), None)
    
    return jsonify({'balance': user['balance']}), 200


# Consulta de transacciones
@app.route('/transactions', methods=['GET'])
def get_transactions():
    session_id = request.args.get('session_id')

    if session_id not in sessions:
        return jsonify({'message': 'Invalid session'}), 401
    
    username = sessions[session_id]
    user_transactions = [tx for tx in transactions if tx['sender'] == username or tx['recipient'] == username]

    return jsonify({'transactions': user_transactions}), 200


# Manejo de excepciones
@app.errorhandler(HTTPException)
def handle_exception(e):
    response = e.get_response()
    response.data = jsonify({"message": str(e)}).data
    response.content_type = "application/json"
    return response


if __name__ == '__main__':
    app.run(debug=True)
