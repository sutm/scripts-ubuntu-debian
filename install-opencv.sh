# KEEP UBUNTU OR DEBIAN UP TO DATE

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove


# INSTALL THE DEPENDENCIES

# Build tools:
sudo apt-get install -y build-essential cmake

# GUI:
sudo apt-get install -y qt5-default libvtk6-dev

# Media I/O:
sudo apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev

# Video I/O:
sudo apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev

# Parallelism and linear algebra libraries:
sudo apt-get install -y libtbb-dev libeigen3-dev

# Python:
sudo apt-get install -y python-dev python-tk python-numpy python3-dev python3-tk python3-numpy

# Java:
#sudo apt-get install -y ant default-jdk

# Documentation:
sudo apt-get install -y doxygen


#sudo apt-get install -y unzip wget
cd ~
wget -O opencv.zip https://github.com/Itseez/opencv/archive/3.1.0.zip
unzip opencv.zip
rm opencv.zip
mv opencv-3.1.0 opencv

wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/3.1.0.zip
unzip opencv_contrib.zip
rm opencv_contrib.zip
mv opencv_contrib-3.1.0 opencv_contrib

sudo pip3 install numpy

cd ~/opencv

mkdir build
cd build

cmake \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=/usr/local \
-DOPENCV_CONFIG_FILE_INCLUDE_DIR=~/opencv/build
-DOPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
-DBUILD_DOCS=ON \
-DBUILD_EXAMPLES=ON \
-DBUILD_TBB=ON \
-DBUILD_TESTS=ON \
-DBUILD_opencv_python2=OFF \
-DINSTALL_C_EXAMPLES=OFF \
-DINSTALL_PYTHON_EXAMPLES=ON \
-DWITH_EIGEN=ON \
-DWITH_OPENGL=ON \
-DWITH_QT=ON \
-DWITH_TBB=ON \
-DWITH_VTK=ON

make -j4
sudo make install
sudo ldconfig

#cd ~/virtualenvs/cv/lib/python3.4/site-packages
#ln -s /usr/local/lib/python3.4/site-packages cv2.so

