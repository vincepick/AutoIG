# Use the Conjure base image
# Conjure: https://github.com/conjure-cp/conjure/blob/main/Dockerfile
FROM ghcr.io/conjure-cp/conjure:main

# Update the package list
RUN apt-get update


# Install necessary packages with frontend=noninteractive to avoid interactive prompts
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
    bash \
    sudo \
    wget \
    curl \
    gnupg \
    software-properties-common \
    unzip

# Install necessary python packages
RUN sudo apt-get install -y python3-pip
RUN apt install python3-pandas -y
RUN apt install python3-numpy -y

# Ensure 'python' command points to Python 3
RUN sudo apt install python-is-python3

# Install R base package for irace
RUN sudo apt-get install r-base -y

# Install Git
RUN sudo apt-get install git-all -y

# Set working directory to root
WORKDIR /


