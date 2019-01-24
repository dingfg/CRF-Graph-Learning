#!/usr/bin/env sh
set -e
TOOLS=./build/tools
$TOOLS/caffe train -solver examples/siamese/img_siamese_solver.prototxt  2>&1 | tee examples/siamese/train_img.log
