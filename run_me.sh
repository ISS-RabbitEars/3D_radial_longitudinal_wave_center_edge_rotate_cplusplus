#!/bin/bash

g++ sw.cpp -o sw
./sw
mkdir cam_path
cd cam_path
mkdir sky
mkdir yz1
cd sky
cp ../../sky_flip.cpp ./
g++ sky_flip.cpp -o sf
./sf
cp ../../rename_sky_cam.sh ./
./rename_sky_cam.sh
cd ../yz1
cp ../../path.cpp ./
g++ path.cpp -o path
./path
cp ../../rename_cam.sh ./
./rename_cam.sh
cd ../../
mkdir points
mv points.dat points/
cd points
split -l 100000 points.dat
cp ../rename.sh ./
cp ../render.sh ./
cp ../points_template.pov ./
