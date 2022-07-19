<script lang="ts">
  // Technically this differs from the spec in that the spec wants the initial values empty, but the
  // code is much simpler when we don't need to worry about null values.
  let celsius = 0;
  let farenheight = 32;

  function onCelsiusChange() {
    farenheight = (celsius * 9) / 5 + 32;
  }

  function onFarenheightChange() {
    celsius = ((farenheight - 32) * 5) / 9;
  }
</script>

<input bind:value={celsius} type="number" on:input={onCelsiusChange} /> Celsius
<input bind:value={farenheight} type="number" on:input={onFarenheightChange} /> Farenheight
