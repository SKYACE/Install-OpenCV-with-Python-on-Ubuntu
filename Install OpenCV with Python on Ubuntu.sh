##########if GPU is not recognized by Ubuntu##########

#update Ubuntu
sudo apt-get update
sudo apt-get upgrade

#download and install driver
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
sudo apt install nvidia-367

#list all graphic cards
sudo lshw -C display





##########Downgrade g++6 to other versions##########

#download and install g++
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install g++-4.9

#check the current version
g++ --version

#look for the path where new g++ installed
which gcc-4.9
which g++-4.9
ls /usr/bin/*-4.9

#go to the path where the system stores the links
cd /usr/bin
ls -l gcc* cpp g++

#delete current links for g++
sudo rm /usr/bin/cpp /usr/bin/gcc /usr/bin/g++

#make new links
sudo ln -s /usr/bin/cpp-4.9 /usr/bin/cpp
sudo ln -s /usr/bin/gcc-4.9 /usr/bin/gcc
sudo ln -s /usr/bin/g++-4.9 /usr/bin/g++

#check the current version
g++ --version

#to revert it back, just use the same commands
sudo rm /usr/bin/cpp /usr/bin/gcc /usr/bin/g++
sudo ln -s /usr/bin/cpp-5 /usr/bin/cpp
sudo ln -s /usr/bin/gcc-5 /usr/bin/gcc
sudo ln -s /usr/bin/g++-5 /usr/bin/g++





##########if Tensorflow cannot find cuDNN##########

sudo apt-get install nvidia-cuda-toolkit
sudo apt-get install nvidia-cuda-361-updates
(download and extract cudann)
sudo cp include/cudnn.h /usr/include
sudo cp lib64/libcudnn* /usr/lib/x86_64-linux-gnu/
sudo chmod a+r /usr/lib/x86_64-linux-gnu/libcudnn*
nvidia-smi
nvcc -V





##########if cannot switch to root##########

sudo passwd





##########install SciPy##########

#upgrade pip to the latest version
python -m pip install --upgrade pip

#download and install packages
pip install --user numpy scipy matplotlib ipython jupyter pandas sympy nose

#add the following at the end of ~/.bachrc file
export PATH="$PATH:/home/your_user/.local/bin"





##########install scikit-learn##########

pip install -U scikit-learn





##########add paths to PYTHONPATH##########

export PYTHONPATH=$PYTHONPATH:/home/dev/python-files





##########uninstall virtualenv##########

#just uninstall virtualenv
sudo apt-get remove virtualenv

#uninstall virtualenv and its dependencies
sudo apt-get remove --auto-remove virtualenv





##########install OpenCV##########

#upgrade any pre-install packages
sudo apt-get update
sudo apt-get upgrade

#install developer tools
sudo apt-get install build-essential cmake git pkg-config

#install image and video related packages
sudo apt-get install libjpeg8-dev libtiff4-dev libjasper-dev libpng12-dev
sudo apt-get install libgtk2.0-dev
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install libatlas-base-dev gfortran

#install numpy
pip install numpy

#download opencv
cd ~
git clone https://github.com/daveselinger/opencv
cd opencv
git checkout 3.1.0-with-cuda8

#download opencv_contrib
cd ~
git clone https://github.com/Itseez/opencv_contrib.git
cd opencv_contrib
git checkout 3.1.0

#build
cd ~/opencv
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D WITH_CUDA=ON \
      -D ENABLE_FAST_MATH=1 \
      -D CUDA_FAST_MATH=1 \
      -D WITH_CUBLAS=1 \
      -D INSTALL_PYTHON_EXAMPLES=ON \
      -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON ..

#compile
make -j4

#install
sudo make install
sudo ldconfig

#link
#cd ~/.virtualenvs/cv/lib/python2.7/site-packages/
#ln -s /usr/local/lib/python2.7/site-packages/cv2.so cv2.so





