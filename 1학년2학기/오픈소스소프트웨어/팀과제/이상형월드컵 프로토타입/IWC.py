from flask import Flask, jsonify
import subprocess

app = Flask(__name__)

@app.route('/')
def index():
    return app.send_static_file('IWC.html')  # IWC.html 파일을 반환

@app.route('/start-worldcup')
def start_worldcup():
    try:
        # Python 프로그램 실행 (예시로 subprocess로 실행)
        subprocess.Popen(['python', 'your_python_program.py'])  # 프로그램 실행
        return jsonify({'status': 'success'})
    except Exception as e:
        print(f"Error: {e}")
        return jsonify({'status': 'error'})

if __name__ == '__main__':
    app.run(debug=True)
