FROM cm2network/steamcmd:root@sha256:f35d6be7522d3d86e55c89201f65e1267a8e2d03b95776a4f79074ad6d3a24cc

RUN apt-get update && apt-get install -y \
  xvfb \
  && rm -rf /var/lib/apt/lists/*

RUN set -x mkdir -p /home/steam/craftopia-server
RUN /home/steam/steamcmd/steamcmd.sh +force_install_dir /home/steam/craftopia-server +login anonymous +app_update 1670340 validate +quit

WORKDIR /home/steam/craftopia-server

RUN ln -sf "/home/steam/craftopia-server/DedicatedServerSave/" "/data"

COPY --chmod=755 entrypoint.sh ./

ENTRYPOINT ["./entrypoint.sh"]