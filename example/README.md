# Example App

This folder contains a sample Sinatra app to test the Dotloop OAuth2 flow.

## Setup

Ensure your Dotloop App ID and Secret are available in the environment:

```bash
export DOTLOOP_APP_ID=YOUR_APP_ID_HERE
export DOTLOOP_APP_SECRET=YOUR_APP_SECRET_HERE
```

Run bundle install from the command line:

```bash
bundle install
```

## Usage

Run the app:

```bash
rackup -p 4567
```

NOTE: Since Dotloop requires SSL, you'll probably need to set up a tunnel using a service like ngrok:

```bash
ngrok http -subdomain=some-custom-subdomain 4567
```
