FROM python:3.7-slim-stretch

RUN apt-get update
 
RUN apt-get install -y --no-install-recommends \
    gcc \
    musl-dev \
    python3-dev \
    build-essential \
    libpq-dev 

RUN pip install jupyter

EXPOSE 8888

RUN date >/build-date.txt

RUN mkdir /timeflow-notebooks
WORKDIR /timeflow-notebooks

CMD ["jupyter", "notebook", "--no-browser", "--allow-root", "--NotebookApp.token=''","--NotebookApp.password=''",  "--ip=0.0.0.0" ]

