FROM archlinux:latest
RUN pacman -Syu --noconfirm graphviz python python-pip \
noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra \
ttf-khmer ttf-lato ttf-liberation && \
pacman -Sc --noconfirm && \
useradd --create-home app
USER app
WORKDIR /home/app/app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY main.py .
EXPOSE 8080
CMD [ "python", "main.py" ]
