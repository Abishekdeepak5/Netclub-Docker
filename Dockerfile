# Use a lightweight Node.js image
FROM node:alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package*.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Install Angular CLI globally
RUN npm install -g @angular/cli

# Copy the rest of the application code
COPY . .

# Expose the port that the application will run on
EXPOSE 4200

# Command to run the application
CMD ["ng", "serve", "--host", "0.0.0.0", "--disable-host-check"]
