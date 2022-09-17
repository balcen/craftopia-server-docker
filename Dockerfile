FROM cm2network/steamcmd:latest

RUN set -x mkdir -p /home/steam/craftopia-server
RUN /home/steam/steamcmd/steamcmd.sh +force_install_dir /home/steam/craftopia-server +login anonymous +app_update 1670340 validate +quit

WORKDIR /home/steam/craftopia-server

COPY --chmod=755 entrypoint.sh ./

ENTRYPOINT ["./entrypoint.sh"]

EXPOSE 6587