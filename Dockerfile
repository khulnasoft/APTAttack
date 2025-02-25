# Use a base image suitable for running the application
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Set the working directory
WORKDIR /app

# Copy necessary files and set up the environment
COPY . .

# Define the entry point for the container
ENTRYPOINT ["cmd", "/c", "APTAttack.bat"]
