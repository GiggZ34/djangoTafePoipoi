FROM python:3.12.2-bullseye

RUN apt-get update && apt-get install -y zsh curl
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

WORKDIR /app

COPY requirements.txt /tmp

RUN pip install -r /tmp/requirements.txt

COPY ./scripts/entrypoint.local.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN rm -rf /tmp

ENTRYPOINT [ "bash", "/entrypoint.sh" ]
