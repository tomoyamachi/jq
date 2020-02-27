FROM busybox:1.31-uclibc AS downloader
ARG REPONAME=stedolan/jq
ARG FILENAME=jq-linux64

WORKDIR /usr/sbin
# use wget : busybox does not contain curl
RUN wget "https://api.github.com/repos/$REPONAME/releases/latest" \
  && VERSION=$(cat latest | grep '"tag_name":' | cut -c16- | rev | cut -c3- | rev ) \
  && echo "version is ${VERSION}" && rm latest \
  && wget https://github.com/$REPONAME/releases/download/$VERSION/$FILENAME -O installed && chmod +x installed

FROM scratch
COPY --from=downloader /usr/sbin/installed /installed
ENTRYPOINT ["/installed"]
CMD []