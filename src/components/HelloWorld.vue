<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <button id="backend-button" type="button" name="button">Hello Backend</button>
    <p id="backend-message"></p>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  }
}

window.addEventListener('load', () => {
  document.getElementById('backend-button').addEventListener('click', async (event) => {
    event.preventDefault();
    const response = await fetch(process.env.VUE_APP_BACKEND);
    const backendMsg = await response.text();
    document.getElementById('backend-message').innerText = backendMsg;
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
