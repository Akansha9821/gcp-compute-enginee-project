from flask import Flask, render_template, request, jsonify

app = Flask(__name__)

@app.route('/')
def index():
    return render_template("form.html")

@app.route('/submit', methods=['POST'])
def submit():
    data = request.get_json()  # receive JSON from fetch
    user_input = data.get("user_input", "")
    response_message = f"Hello, you entered: {user_input}"
    return jsonify({"message": response_message})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
