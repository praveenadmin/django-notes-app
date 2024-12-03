# Stage 1: Build stage with full dependencies
FROM python:3.9-slim AS builder

# Set the working directory inside the container
WORKDIR /app/backend

# Install dependencies
COPY requirements.txt /app/backend/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . /app/backend

# Stage 2: Create a smaller runtime image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app/backend

# Copy only the necessary artifacts from the build stage
COPY --from=builder /app/backend /app/backend

# Expose port 8005 to be able to access it from outside the container
EXPOSE 8005

# Define the command to run the application
CMD ["python", "/app/backend/manage.py", "runserver", "0.0.0.0:8005"]

