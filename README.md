# frontend-example

## Project setup
```
npm install
```
## Environment variables
Set in a `.env` file

```
PORT=<FRONTEND_PORT_TO_USE>
VUE_APP_BACKEND=<URL:PORT_FOR_BACKEND>
```
### Compiles and hot-reloads for development
```
npm run serve
```

### Compiles and minifies for production
```
npm run build
```

### Lints and fixes files
```
npm run lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).

### Run in Docker
`docker build -t frontend-example --build-arg backend_api_url=<BACKEND_URL> .
`

`docker run --env-file=.env --name frontend-example -p <LOCAL_PORT>:<EXPOSED_PORT> frontend-example`
