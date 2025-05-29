

conf_name=sp-lg_m3dv2 # see config dir "configs" for other curated options
data_dir=/workspace/SfM/arkit_sfm/mpsfm/local/example # hosts sfm inputs and outputs when other options aren't specified 
intrinsics_pth=/workspace/SfM/arkit_sfm/mpsfm/local/example/intrinsics.yaml # path to the intrinsics file 
images_dir=/workspace/SfM/arkit_sfm/mpsfm/local/example/images # images directory
cache_dir=/workspace/SfM/arkit_sfm/mpsfm/local/example/cache_dir # extraction outputs: depths, normals, matches, etc.
# extract=["sky", "features", "matches", "depth", "normals"]


python reconstruct.py \
    --conf $conf_name \
    --data_dir $data_dir \
    --intrinsics_pth $intrinsics_pth \
    --images_dir $images_dir \
    --cache_dir $cache_dir \
    --extract \
    --verbose 0 







