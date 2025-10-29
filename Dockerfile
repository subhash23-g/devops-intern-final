# Step 1: Use an official Python image from Docker Hub
FROM python:3.10-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy your Python script into the container
COPY hello.py .

# Step 4: Run the script when the container starts
CMD ["python", "hello.py"]
