FROM --platform=linux/arm64 node
LABEL "Author"="smarthusker"
LABEL "Version"="v0.1"
LABEL "URL"="https://github.com/smarthusker/AlexaCookieContainer"
LABEL "Credit.1"="https://github.com/gabriele-v/hubitat/tree/master/AlexaCookieNodeJs/AlexaCookieNodeJs"
LABEL "Credit.2"="https://github.com/ogiewon/Hubitat/blob/master/AlexaTTS"
ADD https://github.com/gabriele-v/hubitat/archive/refs/heads/master.zip /
RUN unzip /master.zip
WORKDIR /hubitat-master/AlexaCookieNodeJs/AlexaCookieNodeJs/
RUN chmod u+x AlexaCookie.js
RUN npm install
HEALTHCHECK --interval=10m --timeout=5s --retries=2 \
  CMD curl -f http://localhost:81 || exit 1
EXPOSE 81
EXPOSE 82
CMD node AlexaCookie.js