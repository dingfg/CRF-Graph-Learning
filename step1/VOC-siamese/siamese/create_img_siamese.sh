#!/usr/bin/env sh
# This script converts the mnist data into leveldb format.
set -e

EXAMPLES=./build/examples/siamese
DATA=/home/zhenhua/Desktop/LG-Graph/step1/KITTI-siamese

echo "Creating leveldb..."

rm -rf ./examples/siamese/img_siamese_train_leveldb

$EXAMPLES/convertImgToSiamese.bin \
    $DATA/ \
    $DATA/train.txt \
    ./examples/siamese/img_siamese_train_leveldb

echo "Done."
