# use official python base img
FROM python:3.10-slim

# set the working directory
WORKDIR /usr/src/app

# install deps
RUN apt-get update && apt-get install -y \
    apt-utils \
    gcc \
    g++ \
    cmake \
    make \
    libboost-all-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# upgrade pip and install dionysus
RUN pip install --upgrade pip
RUN pip install --verbose dionysus

# copy script to container
COPY script.py .

# run the script when the container starts
CMD ["python", "./script.py"]
