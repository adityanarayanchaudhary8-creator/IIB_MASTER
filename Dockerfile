# Use a base image from IBM for ACE
FROM ibmcom/ace:12.0.7.0-r1

# Copy your application files into the container
# This is where you would place your bar files
COPY my-ace-app.bar /home/aceuser/initial-ace-bar/

# Expose the ports that your application listens on
# Replace 7600 with the actual port your app uses
EXPOSE 7600

# Set the command to run the application when the container starts
CMD ["/bin/bash", "-c", "mqsistart && mqsideploy /home/aceuser/initial-ace-bar/my-ace-app.bar -e default && tail -f /dev/null"]