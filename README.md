<p align="center">
  <img src="assets/seedtool-logo.svg" alt="Seedtool logo" width="120">
</p>

# Seedtool

Seedtool is a static Bitcoin seed utility for learning, testing and verifying how Bitcoin wallet seeds, entropy and wallet components are generated.

This repository provides a dockerized version of the original Seedtool fork. The app is served as a static HTML application via Nginx and is available as a multi-arch Docker image for `linux/amd64` and `linux/arm64`.

## What this tool does

Seedtool helps bitcoiners experiment with and understand seed-related wallet functionality.

Common use cases include:

- Learning how entropy is used to derive wallet components
- Generating seeds from dice rolls, coin flips or playing cards
- Verifying entropy inputs used with external wallets or signing devices
- Generating and checking BIP85 child seeds
- Generating BIP47 payment codes and PayNym avatars
- Generating BIP47 addresses between two payment codes
- Verifying wallet address generation from a seed and passphrase
- Testing for a forgotten or incorrect passphrase if a receive address is known

## Security warning

Never use this tool with real Bitcoin seed phrases on an internet-connected machine.

This tool is intended for education, testing and offline usage. While the tool itself is static and does not require a backend server, other software on your device may still be able to access sensitive information.

For real seed phrases, use the tool only on a trusted offline machine.

## Docker

### Docker Hub

Run the container:

```bash
docker run -d \
  --name seedtool \
  -p 8080:8080 \
  dennysubke/seedtool:2.3.0
```

Open the app in your browser:

```text
http://localhost:8080
```

### GitHub Container Registry

Alternatively, you can use the GHCR image:

```bash
docker run -d \
  --name seedtool \
  -p 8080:8080 \
  ghcr.io/dennysubke/seedtool:2.3.0
```

Open:

```text
http://localhost:8080
```

### Available tags

```text
latest
2.3.0
```

### Docker Compose

Create a `docker-compose.yml`:

```yaml
services:
  seedtool:
    image: dennysubke/seedtool:2.3.0
    container_name: seedtool
    restart: unless-stopped
    ports:
      - "8080:8080"
```

Start the container:

```bash
docker compose up -d
```

Open:

```text
http://localhost:8080
```

Stop the container:

```bash
docker compose down
```

### Use GHCR with Docker Compose

If you prefer GitHub Container Registry, use this image instead:

```yaml
services:
  seedtool:
    image: ghcr.io/dennysubke/seedtool:2.3.0
    container_name: seedtool
    restart: unless-stopped
    ports:
      - "8080:8080"
```

## Build locally

Build the Docker image locally:

```bash
docker build -t seedtool:local .
```

Run it:

```bash
docker run -d \
  --name seedtool \
  -p 8080:8080 \
  seedtool:local
```

Open:

```text
http://localhost:8080
```

## Development

### Install Node.js

Make sure Node.js is installed:

```bash
node --version
```

If Node.js is not installed, using Node Version Manager is recommended:

```bash
nvm install --lts
nvm use --lts
```

### Install dependencies

In the root directory of the project, run:

```bash
npm i
```

### Start development server

```bash
npm run dev
```

Then open:

```text
http://localhost:3000/
```

The page will reload automatically when files in the source folder are changed.

If port `8080` is still in use, kill the process with:

```bash
npx kill-port 8080
```

Then start the development server again:

```bash
npm run dev
```

## Build

Build the static output:

```bash
npm run build
```

The final `index.html` will be generated in the `dist` directory.

## Git workflow

To build and push changes with the existing project script:

```bash
MSG="Added this awesome new feature" npm run git
```

## Docker image publishing

This repository can publish Docker images automatically via GitHub Actions.

The Docker image is built from:

```text
dist/index.html
```

and served with Nginx on container port:

```text
8080
```

Published images:

```text
dennysubke/seedtool
ghcr.io/dennysubke/seedtool
```

Supported platforms:

```text
linux/amd64
linux/arm64
```

## Attribution

This project is based on the original Bitcoin Seed Tool by BitcoinQnA and contributors.

Original project:

```text
https://github.com/BitcoinQnA/seedtool
```

Original online version:

```text
https://bitcoiner.guide/seed
```

## License

This project follows the license of the original Seedtool project.
