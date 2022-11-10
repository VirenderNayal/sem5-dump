from flask import Flask, render_template, request
import pickle 
import numpy as np

model = pickle.load(open('model.pkl', 'rb'))
app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/predict', methods= ['POST'])
def predict_placement():
    cgpa = float(request.form.get('cgpa'))
    iq = int(request.form.get('iq'))

    result = model.predict(np.array([cgpa, iq]).reshape(1,2))

    if result[0] == 1 :
        result = 'placed' 
    else :
        result = 'not placed'

    return render_template('index.html', result = result)


if __name__ == "__main__":
    app.run(debug=True)