#!/bin/bash

set -euo pipefail
source $(dirname $0)/var.sh

FLAGS=(
  "${FFMPEG_CONFIG_FLAGS_BASE[@]}"
   --disable-everything # 减少wasm体积的关键，除了以下的组件外的个别组件都disable
  --enable-filters
  --enable-muxer=image2
  --enable-demuxer=mov # mov,mp4,m4a,3gp,3g2,mj2
  --enable-demuxer=flv
  --enable-demuxer=h264
  --enable-demuxer=asf
  --enable-encoder=mjpeg
  --enable-decoder=hevc
  --enable-decoder=h264
  --enable-decoder=mpeg4
  --enable-protocol=file
  # --enable-gpl            # required by x264
  # --enable-nonfree        # required by fdk-aac
  # --enable-zlib           # enable zlib
  # --enable-libx264        # enable x264
  # --enable-libx265        # enable x265
  # --enable-libvpx         # enable libvpx / webm
  # --enable-libwavpack     # enable libwavpack
  # --enable-libmp3lame     # enable libmp3lame
  # --enable-libfdk-aac     # enable libfdk-aac
  # --enable-libtheora      # enable libtheora
  # --enable-libvorbis      # enable libvorbis
  # --enable-libfreetype    # enable freetype
  # --enable-libopus        # enable opus
  # --enable-libwebp        # enable libwebp
  # --enable-libass         # enable libass
  # --enable-libfribidi     # enable libfribidi
  # --enable-libaom         # enable libaom
)
echo "FFMPEG_CONFIG_FLAGS=${FLAGS[@]}"
emconfigure ./configure "${FLAGS[@]}"
