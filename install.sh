
export PATH=/usr/local/cuda-12.1/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-12.1/lib64:$LD_LIBRARY_PATH

conda create -n mpsfm python=3.11 cmake=3.22.1
conda activate mpsfm 

# pip install torch==2.5.1 torchvision==0.20.1 torchaudio==2.5.1 --index-url https://download.pytorch.org/whl/cu121
pip install torch==2.5.1 torchvision==0.20.1 torchaudio==2.5.1 --index-url https://download.pytorch.org/whl/cu118
pip install -r requirements.txt
pip install ipykernel

#######################################################################
### pyceres Error 
#######################################################################
# Failed to find SuiteSparse : https://github.com/colmap/colmap/issues/2677 
# In pyproject.toml in pyceres, add the following:
# [tool.scikit-build.cmake]
# args=["-DBLAS_LIBRARIES=/usr/lib/x86_64-linux-gnu/blas/libblas.so.3", "-DLAPACK_LIBRARIES=/usr/lib/x86_64-linux-gnu/lapack/liblapack.so.3"]

### export CC=/usr/bin/gcc
### export CXX=/usr/bin/g++

# install pyceres   
# conda install -c conda-forge libstdcxx-ng

# cd pyceres 
# python -m pip install . 

#######################################################################
### install pycolmap from author's fork
#######################################################################
# In colmap folder, 

# first install  
pip install ruff==0.6.7

# if ninja has issue 
ls -l /home/user/.local/bin/ninja
rm /home/user/.local/bin/ninja
pip install ninja
# check: which ninja


# in colmap folder 
mkdir build
cd build
cmake .. -GNinja -DCMAKE_CUDA_ARCHITECTURES=86
ninja
ninja install
cd ../pycolmap
colmap_DIR=<install dir> python -m pip install . -v
# e.g. colmap_DIR=/usr/local/share/colmap python -m pip install . -v

# to verify the actual location 
find /usr/local -type f -name COLMAPConfig.cmake 2>/dev/null#


# if colmap gui has issue in docker container
xhost +local:docker


#######################################################################
### install mpsfm from author's fork
#######################################################################
# In mpsfm folder, 
pip install --upgrade pip setuptools wheel scikit-build-core
python -m pip install -e .

########################################################################
### Install 7zip for downloading ETH
########################################################################
# apt-get install p7zip-full