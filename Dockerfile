FROM alpine:3.8 as build-stage

ARG backend_api_url

WORKDIR /app

COPY . .

RUN apk add --update --no-cache npm && \
    npm install && \
    export VUE_APP_BACKEND=$backend_api_url && \
    npm run build && \
    adduser -D app

FROM alpine:3.8

WORKDIR /app

COPY --from=build-stage /app/dist /app/dist

RUN apk add --update --no-cache npm && \
    npm install -g serve && \
    adduser -D app

USER app

EXPOSE $PORT

CMD /usr/bin/serve -s -l $PORT dist
