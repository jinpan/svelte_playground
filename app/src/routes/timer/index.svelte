<script lang="ts">
  // The https://svelte.dev/examples/7guis-timer uses requestAnimationFrame and progress rather
  // than setInterval and (ab)using an input.
  import { onDestroy } from 'svelte';
  let elapsedTime = 0;
  let duration = 30;

  let interval = setInterval(() => {
    elapsedTime += 0.01;
    elapsedTime = Math.min(elapsedTime, duration);
  }, 10);

  onDestroy(() => clearInterval(interval));
</script>

<input bind:value={elapsedTime} type="range" min="0" max={duration} step="0.01" />
<p>Elapsed: {elapsedTime}s</p>
<input bind:value={duration} type="range" min="0" max="60" />

<button
  on:click={() => {
    elapsedTime = 0;
  }}>Reset</button
>
