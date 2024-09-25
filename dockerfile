# Use the official Python image from the Docker Hub
FROM python:3.8-slim


RUN apt-get update \
    && apt-get install -y \
       build-essential \
       pkg-config \
       libmariadb-dev \
    && rm -rf /var/lib/apt/lists/*
# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirement.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirement.txt

# Copy the rest of your application code into the container
COPY . /app/

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

