# VueJS template

==============

## Description

My project description

## Template Stack

- [Vue3 with Composition API](https://vuejs.org/guide/introduction.html)
- [Vuetify](https://vuetifyjs.com/en/getting-started/installation/)
- [Pinia](https://pinia.vuejs.org/)
- [piniaPluginPersistedstate](https://github.com/prazdevs/pinia-plugin-persistedstate/)

## Formatting / Linting

The template is using [ESLint for VueJS](https://eslint.vuejs.org/).

By default, **auto formatting is enabled on save**.

You can run prettier formatting, but ensure eslint for VueJS is re-apply after.

## I18N

To add any new langage:

- Add new languages in JSON format to `i18n` directory
- Complete 'languages' & 'countries_info' variables in `i18n/index.js`

(see [vue-i18n](https://kazupon.github.io/vue-i18n/) for more documentation)

(see [vue-country-flag-next](https://www.npmjs.com/package/vue-country-flag-next) for country flags)

## Project Setup

### Run locally

```sh
# WITHOUT DOCKER
npm install
npm run dev

# OR 

# WITH DOCKER
# Dev server (vite)
docker build -t <image>:<tag> -f Dockerfile.dev .
docker run --name vuejs_template -p 5173:5173 <image>:<tag>

# Prod server (nginx)
docker build -t <image>:<tag> -f Dockerfile.prod .
docker run --name vuejs_template -p <host_port>:8080 <image>:<tag>  # Port forward to nginx

```

## Tests

```sh
npm run test:unit
npm run type-check
```

## Deployment

### Initialisation

> :warning: **The main.tf file is build from the information passed to cookiecutter. Ensure you answered correctly to all answers or the file won't run**

```bash

# Before running this, replace in main.tf the <API_URL> with the URL of your deployed frontend, or remove the variable

cd vuejs_template
terraform init
terraform apply

```

The main.tf file will deploy:

- The Cloud Run service
- The Secret Manager filled with version

Since we don't know the URL of Cloud Run services, add **manually** secret version with .env content.

## CI/CD

### CI with Github Actions

Use .github/workflows/lint.yaml **by enabling Github Actions API** in your repository

This will run linting for every Pull Request on develop, uat and main branches

### CD with Cloud Build & Cloud Run

.cloudbuild/cloudbuild.yaml is used automatically to deploy to Cloud Run according to your Cloud Build trigger configuration

*Requirements*:

- Create a Cloud Build trigger from GCP:
  - Specify the cloudbuild.yaml path
  - Give repository access to Cloud Build

- Roles:

  - Cloud Build Service Account has Cloud Run Admin role
  - Cloud Build Service Account has Secret Manager Secret Accessor role

## Maintainers

Digital Lab
