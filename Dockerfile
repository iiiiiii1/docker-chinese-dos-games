FROM python:3.6.7-jessie

WORKDIR /

RUN apt install git -y && \
    pip3 install flask gunicorn && \
    git clone --depth 1 https://github.com/rwv/chinese-dos-games && \
    cd chinese-dos-games && python3 download_data.py

WORKDIR /chinese-dos-games

EXPOSE 8080

CMD [gunicorn -w 5 -b 0.0.0.0:8080 app:app]
