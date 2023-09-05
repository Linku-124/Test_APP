# Use the official Python image as the base image
FROM python:3.8-slim



# Set the working directory in the container
WORKDIR /app



# Copy the application code into the container
COPY app.py .



# Install Flask and expose port 7070
RUN pip install flask
EXPOSE 7070



# Define the command to run your application
CMD ["python", "app.py"]
