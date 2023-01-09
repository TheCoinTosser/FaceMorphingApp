FROM python:3.8-slim

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		build-essential \
		git \
		ffmpeg \
		cmake && \
	apt-get purge -y --auto-remove && \
	rm -rf /var/lib/apt/lists/*

# Upgrade pip. Gets rid of the "WARNING: You are using pip version 22.0.4; however, version 22.3.1 is available." message.
RUN pip3 install --upgrade pip

# usr = unix system resources (TL/DR: Hosts system-wide, read-only files). More info at: https://askubuntu.com/a/135679/632828
RUN mkdir /usr/Face-Morphing
WORKDIR /usr/Face-Morphing

# Copying in 2 stages so the cache can do its work because the next run takes a long time to complete...
COPY Face-Morphing/requirements.txt .

# Install the required Python dependencies (takes a loooong time)
RUN pip3 install -r requirements.txt

# Copy the rest of the repo
COPY Face-Morphing .

# This overwrites the CMD ["python3"] command from the python:3.8-slim image
CMD ["/bin/bash", "on_container_start.sh"]
