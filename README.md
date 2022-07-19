This project is a svelte playground.

## Running
See the [Setup](#setup) section for how this playground was initially configured.



## Setup

We start with a simple `Dockerfile`.  Notably, this `Dockerfile` differs from the one at the root
level of the repository.
```
FROM node:18-bullseye-slim

WORKDIR /src
CMD npm run dev
```

and run these commands, loosely following the [sveltekit setup
instructions](https://kit.svelte.dev/)
```
docker build -t svelte-playground . && docker run \
    -v "$(pwd)":/src \
    --rm -it \
    --entrypoint /bin/bash \
    svelte-playground
npm create svelte@latest app
cd app && npm install
```

These were the chosen options.

| Question | Answer |
| -------- | ------ |
| Which Svelte app template? | SvelteKit Demo app |
| Add type checking with TypeScript? | Yes, using TypeScript syntax |
| Add ESLint for code linting? | Yes |
| Add Prettier for code formatting? | Yes |
| Add Playwright for browser testing? | Yes |

Afterwards, the `app/vite.config.js` file was updated with these server settings so the vite dev
server can be accessed from the docker host:
```
server: {
    host: '0.0.0.0',
    port: 5173,
}
```

Some minor changes were made to `.prettierrc`.

## Historical Archive
These are internal notes and can be disregarded for all but the most avid readers.

Initially, the `app/` directory was scaffolded via `npm init vite app -- --template svelte`,
following the [svelte setup instructions](https://svelte.dev/blog/svelte-for-new-developers).

But this was quickly decided against to adopt sveltekit.
