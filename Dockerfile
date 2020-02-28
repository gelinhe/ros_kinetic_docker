FROM osrf/ros:kinetic-desktop-full-xenial
RUN echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install git -y
RUN apt-get install sudo -y
RUN apt-get install wget -y
RUN apt-get install gedit -y
WORKDIR /temp
RUN git clone https://github.com/yuzhangbit/apollo_standalone
WORKDIR /temp/apollo_standalone
RUN bash scripts/install_dependencies.sh
RUN echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
WORKDIR /home
