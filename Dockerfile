FROM python:3.8

RUN apt-get update && apt-get install -y build-essential ssh

ARG token

RUN git config --global url."https://${token}:@github.com/".insteadOf "https://github.com/"

RUN pip install flask

RUN git clone https://github.com/PetBiotech/Pbt-portal-login.git /app

WORKDIR /app

RUN pip install -r requirements.txt

CMD ["flask", "run", "--host", "0.0.0.0"]

EXPOSE 5000

VOLUME ["/root/.ssh"]