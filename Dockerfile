FROM debian:bookworm

#Latex packages
RUN apt-get update && \
	apt-get install -y --no-install-recommends texlive-latex-recommended texlive-fonts-recommended && \
	apt-get install -y --no-install-recommends texlive-latex-extra texlive-fonts-extra texlive-lang-all && \
	rm -rf /var/lib/apt/lists/*

RUN echo "deb  http://deb.debian.org/debian  bookworm main" >> /etc/apt/sources.list && \
	echo "deb-src  http://deb.debian.org/debian  bookworm main" >> /etc/apt/sources.list && \
	apt-get update

RUN apt-get install -y --no-install-recommends software-properties-common && \
	apt-get update

RUN apt-get install -y --no-install-recommends texlive-xetex
RUN useradd -ms /bin/bash latex
USER latex
WORKDIR /home/latex
# Default command 
ENTRYPOINT ["xelatex", "resume.xtx"]

