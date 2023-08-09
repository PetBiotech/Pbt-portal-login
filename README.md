## PBT-Portal

### Instructions
For the deployment follow the procedure.
- #### SSH to VM instance
  ```
  ssh user@host
  ```
- #### Create virtualenv
  ```
  mkdir app
  cd app
  pip3 install virtualenv
  python3 -m virtualenv flaskenv
  chmod 755 flaskenv/
  ```
- #### Install dependencies in venv
  ```
  source flaskenv/bin/activate
  python -V
  pip install -r requirements.txt
  ```
- #### Run application in debug mode
  ```
  flask run --host 0.0.0.0
  ```
- #### Check for port and enable traffic through port
  ```
  telnet <server-IP> 5000
  sudo iptables -I INPUT -p tcp --dport 5000 -j ACCEPT
  ```
- #### Configure WSGI server
  ```
  gunicorn --bind 0.0.0.0:5000 app:app --reload & >> /dev/null
  ```

This will run the portal on the VM, use the host flag in debug mode to access it through the network. For more information refer to this [link](https://krishansubudhi.github.io/webapp/2018/12/01/flaskwebapp.html)

### To stop the application
- Know which port is used to run the application (usually 5000)
```
sudo lsof -i TCP:5000
```
- Get the pid of the process from the above command, stop it using the command given below
```
kill -9 <pid_value>
```
#### Key Libraries
* flask
* flask-sqlaclhemy
* flask-login
* flask-admin
* flask-wtforms
* wtforms
