
# A very simple Flask Hello World app for you to get started with...

from flask import Flask, request
from processing import do_calculation

app = Flask(__name__)
app.config["DEBUG"] = True

@app.route("/", methods=["GET", "POST"])
def adder_page():
    errors = ""
    if request.method == "POST":
        text = str(request.form["text"])
        result = do_calculation(text)
        return '''
            <html>
                <body>
                    <p>Diagnostics result is {result}</p>
                    <p><a href="/">Click here to run diagonostics again</a>
                </body>
            </html>
        '''.format(result=result)

    return '''
        <html>
            <body>
                {errors}
                <p>Enter your phrase:</p>
                <form method="post" action=".">
                    <p><input name="text" /></p>
                    <p><input type="submit" value="Run Diagonostics" /></p>
                </form>
            </body>
        </html>
    '''.format(errors=errors)
