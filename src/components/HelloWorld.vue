<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <button id="backend-button" type="button" name="button">Hello Backend</button>
    <p id="backend-message"></p>
    <button id="service-button" type="button" name="button">Hello Service from Backend</button>
    <p id="service-message"></p>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  }
}

const backend_url = process.env.VUE_APP_BACKEND;
const service_api_path = process.env.VUE_APP_SERVICE_API_PATH;

window.addEventListener('load', () => {
  document.getElementById('backend-button').addEventListener('click', async (event) => {
    event.preventDefault();
    const response = await fetch(backend_url);
    const backendMsg = await response.text();
    document.getElementById('backend-message').innerText = backendMsg;
  });
});

window.addEventListener('load', () => {
  document.getElementById('service-button').addEventListener('click', async (event) => {
    event.preventDefault();
    const response = await fetch(`${backend_url}/${service_api_path}`);
    const backendMsg = await response.text();
    document.getElementById('service-message').innerText = backendMsg;
  });
});

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
