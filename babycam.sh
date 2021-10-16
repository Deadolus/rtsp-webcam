#!/bin/bash
VIDSOURCE='rtsp://user:pass@192.168.1.30:554/11'
AUDIO_OPTS="-c:a aac -b:a 160000 -ac 2"
VIDEO_OPTS="-tune zerolatency -c:v copy -r 20  -fflags nobuffer" #-b:v 800000"
mkdir -p /tmp/babycam
rm /tmp/babycam/*
ffmpeg -i $VIDSOURCE -y $AUDIO_OPTS $VIDEO_OPTS -fflags nobuffer -f dash -window_size 4 -extra_window_size 0 -min_seg_duration 2000000 -remove_at_exit 1 -segment_wrap 10 /tmp/babycam/playlist.mpd

