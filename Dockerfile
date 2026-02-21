FROM archlinux:base

RUN pacman -Sy --noconfirm --needed archlinux-keyring && \
    pacman -Su --noconfirm --needed \
        graphviz python python-pip \
        python-graphviz python-cherrypy \
        noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra \
        ttf-khmer ttf-lato ttf-liberation && \
    pacman -Scc --noconfirm && \
    rm -rf /var/lib/pacman/sync/*

RUN useradd --create-home app
USER app
WORKDIR /home/app/app

# COPY --chown=app:app requirements.txt .
# RUN pip install --break-system-packages -r requirements.txt

COPY --chown=app:app main.py .

EXPOSE 8080

CMD [ "python", "main.py" ]
