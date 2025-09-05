from flask import Flask, jsonify
from src.app import soma, multiplica, subtrai, divide

app = Flask(__name__)


@app.route('/')
def home():
    return jsonify({
        "message": "CI/CD Calculator API",
        "version": "1.0.0",
        "endpoints": {
            "/": "Home page",
            "/health": "Health check",
            "/soma/<int:a>/<int:b>": "Addition",
            "/multiplica/<int:a>/<int:b>": "Multiplication",
            "/subtrai/<int:a>/<int:b>": "Subtraction",
            "/divide/<int:a>/<int:b>": "Division"
        }
    })


@app.route('/health')
def health():
    return jsonify({"status": "healthy", "service": "calculator-api"})


@app.route('/soma/<int:a>/<int:b>')
def api_soma(a, b):
    try:
        result = soma(a, b)
        return jsonify({"operation": "sum", "a": a, "b": b, "result": result})
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route('/multiplica/<int:a>/<int:b>')
def api_multiplica(a, b):
    try:
        result = multiplica(a, b)
        return jsonify({
            "operation": "multiply",
            "a": a,
            "b": b,
            "result": result
        })
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route('/subtrai/<int:a>/<int:b>')
def api_subtrai(a, b):
    try:
        result = subtrai(a, b)
        return jsonify({
            "operation": "subtract",
            "a": a,
            "b": b,
            "result": result
        })
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route('/divide/<int:a>/<int:b>')
def api_divide(a, b):
    try:
        result = divide(a, b)
        return jsonify({
            "operation": "divide",
            "a": a,
            "b": b,
            "result": result
        })
    except Exception as e:
        return jsonify({"error": str(e)}), 400


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=False)
