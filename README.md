# KUFRL Software-Stack Upgrade
We provide to method to upgrade KUFRL software stack.
The first method is to install an Ubuntu 20.04 on the Jetson Nano, and then install everything else on the Ubuntu. We recommend this method for deployment.
In the second method, we use Docker containers to provide a virtual machine that has an Ubuntu 20.04 installed on it, and then we install ROS 2 and all other required packages on the virtual machine provided by Docker.
This method is suitable for testing purposes, where you want to run both drone and GCS apps on one computer.

## ROS 2 installation on Ubuntu 20.04 (Recommended)
We assume you have a system with an Ubuntu 20.04 installed on it. From there, you can run
the ```install-all-on-ubuntu-20.04.sh``` file to install ROS 2 and all the required packages.

```./install-all-on-ubuntu-20.04.sh```

By running ```install-all-on-ubuntu-20.04.sh```, you also install all the required python packages. A list of required
python packages, and their corresponding versions, is available in ```requirements.txt```. You can add more packages to
this list and all of them would be installed on your operating system.

At the end of the installation, we run a test ROS program to make sure that the installation was successful. This is a
simple "hello world" program written in ROS to just test the installation, and you can kill it after you made sure that
the installation was successful. 


## ROS 2 Docker installation

### Install Docker
For this method, you first need to install Docker on your machine using ```install-docker.sh``` file and running it on your machine.

```install-docker.sh```

Then, you can test your installation by running the following command:

```test-docker-installation.sh```

### Use ROS Docker
In order to use the docker container, you need to first build the docker image and then run it. You can find the description of the Docker image in a file named:```Dockerfile```.
You can build this file by running the following command on your terminal:

```
docker build -t ros-foxy .
```
Note that you need to be in the directory that the ```Dockerfile``` is located, and then, run this command.

Now that you built the Docker image, you can run it by executing the following command:
```
docker run ros-foxy
```

