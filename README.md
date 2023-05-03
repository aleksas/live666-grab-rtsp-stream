# live666-grab-rtsp-stream
Grab RTSP stream and save to video file

You can save the RTSP stream as follows:

`./testProgs/openRTSP -4 -v -t -P 9 -d 20 -B 20000000 -b 20000000 rtsp://your_rtsp_stream_url`

Here's a brief explanation of the options you used:

 - `-t`: Use TCP for the RTSP/RTP stream transport.
 - `-v`: Save video only (no audio).
 - `-4`: Save the video stream in MPEG4 format.
 - `-P 9`: Save the video stream in separate files with a duration of 9 seconds each.
 - `-d 20`: Save the RTSP stream for a total duration of 20 seconds.
 - `-B 20000000`: Set the input socket buffer size to 20,000,000 bytes.
 - `-b 20000000`: Set the file-sink buffer size to 20,000,000 bytes.

Using these options, you can save the RTSP stream in the MPEG4 format using the live666 openRTSP test program. Make sure to replace your_rtsp_stream_url with the actual RTSP stream URL.

# docker
See [Dockerfile](./Dockerfile) and [docker-compose.yml](./docker-compose.yml) for simple stream saving
