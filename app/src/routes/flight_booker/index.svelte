<script lang="ts">
  let flightType = 'oneway';
  let startDate = '2022-07-19';
  let endDate = '2022-07-19';
  let bookDisabled = true;

  $: endDateDisabled = flightType === 'oneway';
  $: if (flightType === 'return') {
    bookDisabled = startDate > endDate;
  } else {
    bookDisabled = false;
  }

  let message = '';
</script>

<select bind:value={flightType} on:change={() => (message = '')}>
  <option value={'oneway'}>one-way flight</option>
  <option value={'return'}>return flight</option>
</select>

<input bind:value={startDate} on:change={() => (message = '')} type="date" />
<input
  bind:value={endDate}
  disabled={endDateDisabled}
  on:change={() => (message = '')}
  type="date"
/>

<button disabled={bookDisabled} on:click={() => (message = `${flightType}/${startDate}/${endDate}`)}
  >Book</button
>

<p>{message}</p>
