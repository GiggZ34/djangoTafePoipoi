FROM python:3.12.2-bullseye

# Create project folder
RUN mkdir /app

# Define that folder as workdir
WORKDIR /app

# Copy source code in workdir
COPY . .

# Installation all depencies
RUN pip install -r requirements.txt


# copy and set rights on entrypoint script
COPY ./scripts/entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "bash", "/entrypoint.sh" ]
