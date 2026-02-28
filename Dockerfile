# Use the official slim Python 3.11 image
FROM python:3.11-slim

# Set environment variables
ENV FLDIGI_VERSION=4.0.4

# Install fldigi dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    fldigi=${FLDIGI_VERSION}-1 \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Command to run the application
CMD ["python", "app.py"]