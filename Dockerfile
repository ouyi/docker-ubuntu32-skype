FROM ouyi/docker-ubuntu-precise-core-i386
MAINTAINER Yi Ou

ENV DEBIAN_FRONTEND noninteractive

RUN echo "nameserver 8.8.8.8" > tee /etc/resolv.conf 

# Install Skype and PulseAudio.
WORKDIR /usr/src
RUN apt-get -y update \
	&& apt-get install -y --no-install-recommends \
		libpulse0 \
		pulseaudio \
		curl \
		libqt4-dbus \
		libqt4-network \
		libqt4-xml \
		libqtcore4 \
		libqtgui4 \
		libqtwebkit4 \
		libxss1 \
		libxv1 \
		libssl1.0.0 \
	&& curl -Lo skype.deb http://www.skype.com/go/getskype-linux-deb-32 \
	&& apt-get purge -y --auto-remove curl \
	&& { dpkg -i skype.deb || true; } \
	&& rm skype.deb \
	&& rm -rf /var/lib/apt/lists/* \
	&& echo enable-shm=no >> /etc/pulse/client.conf

# PulseAudio server.
ENV PULSE_SERVER /run/pulse/native

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["skype"]
