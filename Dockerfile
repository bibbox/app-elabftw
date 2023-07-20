# Use docker for a small base image
FROM docker:latest

# Install bash and curl
RUN apk add --no-cache bash curl

# Add the script to the container
COPY data/dbinstall.sh /dbinstall.sh

# Make sure the script is executable
RUN chmod +x /dbinstall.sh

CMD ["/bin/bash", "/dbinstall.sh"]
