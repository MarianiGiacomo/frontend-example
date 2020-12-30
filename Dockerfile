FROM alpine:3.8 as build-stage
LABEL stage=builder

ARG backend_url
ARG service_api_path

WORKDIR /app

COPY . .

RUN apk add --update --no-cache npm && \
    npm install && \
    export VUE_APP_BACKEND=$backend_url && \
    export VUE_APP_SERVICE_API_PATH=$service_api_path && \
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
