FROM ubuntu:14.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y ruby1.9
RUN apt-get install -y git curl
RUN apt-get install -y ngrok-client
RUN gem i bundler
RUN apt-get install -y build-essential
RUN bundle config jobs 8
