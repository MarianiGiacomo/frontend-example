FROM alpine:3.8 as build-stage

ARG backend_api_url

WORKDIR /app

COPY . .

RUN apk add --update --no-cache npm && \
    npm install && \
    export VUE_APP_BACKEND=$backend_api_url && \
    printenv && \
    npm run build && \
    npm install -g serve && \
    adduser -D app

USER app

EXPOSE $PORT

CMD /usr/bin/serve -s -l $PORT dist
