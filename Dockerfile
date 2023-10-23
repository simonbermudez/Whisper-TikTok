FROM nvidia/cuda:12.2.2-base-ubuntu22.04
RUN apt update && apt install -y ffmpeg
RUN mkdir /ffmpeg

WORKDIR /workspace

# Install Python
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get -y update && \
    apt-get install -y python3.11 python3-pip

# Copy the requirements file into the container
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-input --disable-pip-version-check -r requirements.txt

# Copy the rest of your Python application code into the container
COPY . .

# Command to run your Python application
CMD ["python3", "code/worker.py"]