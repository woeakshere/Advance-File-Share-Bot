FROM python:3.8-slim-buster

# Update and install git
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt /requirements.txt

# Install Python dependencies
RUN pip install -U pip && \
    pip install -U -r /requirements.txt

# Create application directory
RUN mkdir /Advance-File-Share-Bot
WORKDIR /Advance-File-Share-Bot

# Copy start script
COPY start.sh /start.sh

# Set the command to run the start script
CMD ["/bin/bash", "/start.sh"]
