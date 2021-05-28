# Use the AWS Linux container as the base image
FROM python:alpine

# Specify your e-mail address as the maintainer of the container image
MAINTAINER Tula Holt "tholt@pdx.edu"

# Copy the contents of the current directory into the container directory /app
COPY . /app


# Set the working directory of the container to /app
WORKDIR /app

# Install the Python packages specified by requirements.txt into the container
RUN pip install -r requirements.txt

# Set the parameters to the program
CMD exec gunicorn --bind :${PORT:-80} --workers 1 --threads 8 application:application
