from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/health')
def health_check():
    # Basic checks to verify liveness (replace with your checks)
    try:
        # Perform checks (e.g., database connection, data retrieval)
        return jsonify({'status': 'healthy'})
    except Exception as e:
        # Handle exceptions gracefully for liveness check
        return jsonify({'status': 'unhealthy'}), 500


# docker run --name flask-container-1 -p 8081:5000 flask-app-1
# 404cdefa040b4d16b3c860e6d87b6af0