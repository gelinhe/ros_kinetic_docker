FROM osrf/ros:kinetic-desktop-full-xenial
RUN echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
RUN apt-get update
RUN apt-get install git -y
RUN apt-get install sudo -y
RUN apt-get install wget -y
RUN apt-get install gedit -y 
RUN apt-get install autoconf automake libtool -y 
RUN add-apt-repository ppa:vascofalves/gnome-backports
RUN apt-get update
RUN apt-get install nautilus
WORKDIR /
RUN git clone https://github.com/gelinhe/apollo_standalone
WORKDIR /apollo_standalone
RUN bash scripts/install_dependencies.sh
RUN mkdir -p src/apollo/build 
WORKDIR /apollo_standalone
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc

