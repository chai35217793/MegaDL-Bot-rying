FROM debian:latest

# Update and install necessary packages
RUN apt update && apt upgrade -y
RUN apt install git python3-pip python3-venv ffmpeg -y

# Clone the repository
RUN git clone https://github.com/AsmSafone/MegaDL-Bot /MegaDL-Bot
WORKDIR /MegaDL-Bot

# Set up and use a virtual environment
RUN python3 -m venv venv
RUN . venv/bin/activate && pip install --upgrade pip
RUN . venv/bin/activate && pip install -U -r requirements.txt

# Run the application
CMD ["venv/bin/python3", "main.py"]
