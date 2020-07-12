FROM python:3.7-slim-stretch

RUN apt-get update

RUN apt-get -y install libblas3 liblapack3 liblapack-dev libblas-dev 
RUN apt-get -y install gfortran


RUN apt-get install -y --no-install-recommends \
    gcc \
    musl-dev \
    python3-dev \
    build-essential \
    libpq-dev 

RUN pip install jupyter
RUN pip install pydruid
RUN pip install matplotlib
RUN pip install pandas
RUN pip install plotly

RUN pip install numpy
RUN pip install uwsgi
RUN pip install pystan
RUN pip install pyspark

COPY requirements.txt .

RUN pip install -r requirements.txt


EXPOSE 8888

RUN date >/build-date.txt

RUN mkdir /timeflow-notebooks
WORKDIR /timeflow-notebooks

ADD example.ipynb /timeflow-notebooks

CMD ["jupyter", "notebook", "--no-browser", "--allow-root", "--NotebookApp.token=''","--NotebookApp.password=''",  "--ip=0.0.0.0" ]

