# syntax=docker/dockerfile:1

# Use slim Python base image for smaller size
FROM python:3.11-slim AS base

# Set working directory
WORKDIR /app

# Copy requirements first (for caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY app/ .

# Run the application
CMD ["python", "main.py"]

