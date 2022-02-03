FROM python:3

WORKDIR /usr/src/app

COPY requirements.txt server.py ./

RUN pip install --no-cache-dir -r requirements.txt 

COPY . .

EXPOSE 502/tcp

# ENTRYPOINT [ "pymodbus.console" ]
ENTRYPOINT ["python", "server.py", ">", "server.log" ]
