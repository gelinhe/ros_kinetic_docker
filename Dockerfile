FROM osrf/ros:kinetic-desktop-full-xenial
RUN echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
RUN apt-get update
RUN apt-get install git -y
RUN apt-get install sudo -y
RUN apt-get install wget -y
RUN apt-get install gedit -y 
RUN apt-get install zip -y
RUN apt-get install autoconf automake libtool -y 
RUN apt-get update
RUN apt-get install nautilus -y
RUN apt-get install python-pip -y
RUN pip install protobuf==3.3.0
WORKDIR /
RUN git clone --recursive https://github.com/gelinhe/apollo_standalone
WORKDIR /apollo_standalone
RUN bash scripts/install_dependencies.sh
RUN mkdir -p src/apollo/build 
WORKDIR /home
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt-get update
RUN echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc

