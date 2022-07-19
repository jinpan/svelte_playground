This project is a svelte playground.

We will implement the some of the [7 Tasks GUI Benchmark](https://eugenkiss.github.io/7guis/tasks)
here.  This has been [done before](https://svelte.dev/examples/7guis-counter), and this serves as an
exercise for myself to better understand how to use svelte(kit).

## Running
See the [Setup](#setup) section for how this playground was initially configured.

Run the `./run_local.sh` script to start the docker container.  Open `localhost:5173` in a browser
window.

For continuous checks, run `docker exec svelte_playground npm run check:watch`, which in turn calls
[svelte-check](https://www.npmjs.com/package/svelte-check) and warns on unused css, a11y hints, and
typescript compilation errors.

This doesn't run the linter and tests.  That should probably be run on CI and during the late stages
of development, and there doesn't seem to be a continuous runner configured for us.

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

These were the chosen options:

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
