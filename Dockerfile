FROM debian:buster AS config

FROM config AS dev

RUN mkdir -p /root/workspaces \
    && apt-get update \
    && apt-get -y install build-essential libssl-dev cmake git gdb

FROM dev AS build

RUN git clone --depth 1 https://github.com/MobotixAG/live666 /root/workspaces/live666
RUN cmake -E make_directory /root/workspaces/live666-build
RUN cmake -S /root/workspaces/live666 -B /root/workspaces/live666-build
RUN cmake --build /root/workspaces/live666-build --target install -- -l
WORKDIR /root/workspaces/live666
RUN bash ./genMakefiles linux
RUN make || true

ENTRYPOINT ["/root/workspaces/live666/testProgs/openRTSP"]
CMD ["-4", "-v", "-t", "-P", "9", "-d", "20", "-B", "20000000", "-b", "20000000", "-F", "/opt/output/video", "rtsp://stream-url"]
