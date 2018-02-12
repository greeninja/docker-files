#!/bin/bash

if [[ $type == "ladscape" ]]; then
  ffmpeg -y -i $image_path/$image -filter_complex '[0:v]scale=ih*16/9:-1,boxblur=luma_radius=min(h\,w)/20:luma_power=1:chroma_radius=min(cw\,ch)/20:chroma_power=1[bg];[bg][0:v]overlay=(W-w)/2:(H-h)/2,crop=h=iw*9/16' -strict -2 $image_path/landscape_$image
elif [[ $type == "mov" ]]; then
  ffmpeg -y -i $image_path/$image.mov -strict -2 $image_path/$image.mp4
  ffmpeg -y -i $image_path/$image.mov $image_path/$image.ogv
  ffmpeg -y -i $image_path/$image.mov $image_path/$image.webm
elif [[ $type == "mp4" ]]; then
  ffmpeg -y -i $image_path/$image.mp4 $image_path/$image.ogv
  ffmpeg -y -i $image_path/$image.mp4 $image_path/$image.webm
fi
