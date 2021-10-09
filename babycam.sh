#!/bin/bash
VIDSOURCE='rtsp://aeLm3mLMJnie:SCHLQ6zTBke2@192.168.1.30:554/11'
#VIDSOURCE='rtsp://aeLm3mLMJnie:SCHLQ6zTBke2@192.168.1.30:554/12'
AUDIO_OPTS="-c:a aac -b:a 160000 -ac 2"
#VIDEO_OPTS="-tune zerolatency -c:v libx264 " #-b:v 800000"
#VIDEO_OPTS="-tune zerolatency -c:v h264_omx -b:v 4M" #-b:v 800000"
#VIDEO_OPTS="-tune zerolatency -c:v h264_omx -b:v 2M" #-b:v 800000"
VIDEO_OPTS="-tune zerolatency -c:v copy -r 20  -fflags nobuffer" #-b:v 800000"
#OUTPUT_HLS="-hls_time 2 -hls_init_time 2 -hls_list_size 1 -start_number 1 -live_start_index -1 -hls_delete_threshold 2 -hls_flags single_file"
#OUTPUT_HLS="-hls_time 10 -hls_init_time 10 -hls_list_size 1 -start_number 1 -live_start_index -1 -hls_delete_threshold 2 -x264-params keyint=100:min-keyint=100 -hls_flags delete_segments"
#ffmpeg -i "$VIDSOURCE" -y $AUDIO_OPTS $VIDEO_OPTS $OUTPUT_HLS /var/www/html/babycam2/playlist.m3u8
#ffmpeg -i "$VIDSOURCE" -y $AUDIO_OPTS $VIDEO_OPTS -f dash -window_size 10 -use_template 1 -use_timeline 1  -remove_at_exit 1 -frag_duration 5 -streaming 1 -segment_wrap 10 /var/www/html/babycam/playlist.mpd
#/snap/bin/ffmpeg -i "$VIDSOURCE" -y $AUDIO_OPTS $VIDEO_OPTS -f dash -window_size 1 -use_template 1 -use_timeline 1  -remove_at_exit 1 -tune zerolatency -frag_duration 2 -streaming 1 -segment_wrap 10 -ldash 1 playlist.mpd
#ffmpeg -i "$VIDSOURCE" -y $AUDIO_OPTS $VIDEO_OPTS -f dash -window_size 10 -use_template 1 -use_timeline 1  -remove_at_exit 1 -segment_wrap 10 /var/www/html/babycam/playlist.mpd
mkdir -p /tmp/babycam
rm /tmp/babycam/*
#ffmpeg -i "$VIDSOURCE" -y $AUDIO_OPTS $VIDEO_OPTS -f dash -window_size 10 -use_template 1 -use_timeline 0 -adaptation_sets “id=0,streams=v id=1,streams=a” -seg_duration 4 -frag_duration 1 -window_size 15 -extra_window_size 15  -remove_at_exit 1 -frag_duration 2 -segment_wrap 10 /tmp/babycam/playlist.mpd
#ffmpeg -i "$VIDSOURCE" -y $AUDIO_OPTS $VIDEO_OPTS -f dash -window_size 10 -use_template 1 -use_timeline 0 -seg_duration 4  -window_size 15 -extra_window_size 15  -remove_at_exit 1 -segment_wrap 10 -frag_duration 1 /tmp/babycam/playlist.mpd
#ffmpeg -i "$VIDSOURCE" -y $AUDIO_OPTS $VIDEO_OPTS -f dash -window_size 10 -use_template 1 -use_timeline 0 -index_correction 1 -seg_duration 4  -window_size 15 -extra_window_size 15  -remove_at_exit 1 -segment_wrap 10 -frag_duration 1 -adaptation_sets "id=0,streams=v id=1,streams=a" /tmp/babycam/playlist.mpd
#ffmpeg -i "$VIDSOURCE" -y $AUDIO_OPTS $VIDEO_OPTS -f dash -window_size 10 -use_template 1 -use_timeline 0 -index_correction 1 -seg_duration 4  -window_size 15 -extra_window_size 15  -remove_at_exit 1 -segment_wrap 10 -frag_duration 1 -adaptation_sets "id=0,streams=v id=1,streams=a" /tmp/babycam/playlist.mpd
#ffmpeg -i "$VIDSOURCE" -y $AUDIO_OPTS $VIDEO_OPTS -f dash -window_size 10 -use_template 1 -use_timeline 0 -seg_duration 4 -frag_duration 1 -window_size 15 -extra_window_size 15  -remove_at_exit 1 -frag_duration 2 -segment_wrap 10 /tmp/babycam/playlist.mpd

#ffmpeg -i $VIDSOURCE -c:v h264 -force_key_frames "expr:gte(t,n_forced*4)" -profile:v baseline -an -f dash -streaming 1 -use_template 1 -use_timeline 0 -seg_duration 4 -frag_duration 1 -utc_timing_url "https://time.akamai.com/?iso"  -window_size 15 -extra_window_size 15 -remove_at_exit 1 -f dash /tmp/babycam/playlist.mpd
#ffmpeg -i "$VIDSOURCE" -y $AUDIO_OPTS $VIDEO_OPTS -f dash  -window_size 10 -extra_window_size 0  -use_template 0 -use_timeline 1 -seg_duration 4 -frag_duration 2 -window_size 15 -extra_window_size 15  -remove_at_exit 1 -frag_duration 2 -segment_wrap 10 -streaming 1 -utc_timing_url "https://time.akamai.com/?iso" /tmp/babycam/playlist.mpd
#gffmpeg -i $VIDSOURCE -y $AUDIO_OPTS $VIDEO_OPTS -fflags nobuffer -f dash -window_size 4 -extra_window_size 0 -min_seg_duration 2000000 -remove_at_exit 1  /tmp/babycam/playlist.mpd
#ffmpeg -i $VIDSOURCE -y $AUDIO_OPTS $VIDEO_OPTS -fflags nobuffer -f dash -window_size 4 -extra_window_size 0 -remove_at_exit 1 -segment_wrap 10 -use_template 1 -min_seg_duration 2000000 -streaming 1 -seg_duration 4 -frag_duration 2  /tmp/babycam/playlist.mpd
#ffmpeg -i $VIDSOURCE -y $AUDIO_OPTS $VIDEO_OPTS -fflags nobuffer -f dash -window_size 4 -extra_window_size 0 -utc_timing_url "https://time.akamai.com/?iso" -remove_at_exit 1 -segment_wrap 10 -use_template 1 -min_seg_duration 2000000 -streaming 1 -seg_duration 4 -frag_duration 2  /tmp/babycam/playlist.mpd
ffmpeg -i $VIDSOURCE -y $AUDIO_OPTS $VIDEO_OPTS -fflags nobuffer -f dash -window_size 4 -extra_window_size 0 -min_seg_duration 2000000 -remove_at_exit 1 -segment_wrap 10 /tmp/babycam/playlist.mpd

#ffmpeg -i "$VIDSOURCE" -y $AUDIO_OPTS $VIDEO_OPTS -f dash -window_size 10 -use_template 1 -use_timeline 1  -remove_at_exit 1 -frag_duration 5 -streaming 1 -segment_wrap 10 /tmp/babycam/playlist.mpd
