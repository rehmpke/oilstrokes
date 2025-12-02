# oilstrokes

![Deploy](https://github.com/rehmpke/oilstrokes/actions/workflows/deploy.yml/badge.svg)
![Node Version](https://img.shields.io/badge/Node-22.15.0-339933?style=flat&logo=node.js&logoColor=white)
![Jekyll](https://img.shields.io/badge/Jekyll-4.x-CC0000?style=flat&logo=jekyll&logoColor=white)
![Ruby](https://img.shields.io/badge/Ruby-3.3.4-CC342D?style=flat&logo=ruby&logoColor=white)
![AWS S3](https://img.shields.io/badge/AWS-S3-orange?style=flat&logo=amazonaws&logoColor=white)
![CloudFront](https://img.shields.io/badge/AWS-CloudFront-92278F?style=flat&logo=amazonaws&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/CI-GitHub%20Actions-2088FF?style=flat&logo=githubactions&logoColor=white)
![License](https://img.shields.io/badge/License-All%20Rights%20Reserved-lightgrey?style=flat)


This repository powers **oilstrokes.com**, a minimalist Jekyll-based showcase of Roger Ehmpke’s traditional oil portrait work. The site emphasizes clean markup, strong accessibility practices, fast performance, and zero-framework dependency for maximal longevity.

Deployment is handled through an automated GitHub Actions → S3 → CloudFront pipeline, enabling fast and reliable pushes from the `master` branch with instant CDN cache invalidation.

<p align="center">
  <img src="https://oilstrokes.com/assets/img/rachel_verdaccio_large2.jpg" width="600" style="border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.08);"/>
</p>

---

## 🔧 Requirements

### Ruby

Ruby Version: **3.3.4**\
(defined in `.ruby-version`)

Install dependencies:

```bash
gem install bundler
bundle install
```

### Jekyll

This project uses classic Jekyll without additional build tooling:

```bash
bundle add jekyll
```

---

## 🧱 Architecture Overview

This site is intentionally simple and durable — no frameworks, no JavaScript bundlers, and no heavy build chains.

### 1. Jekyll handles:

- Templating and layouts
- Page rendering
- Head metadata + SEO
- Final HTML output into `_site/`

### 2. GitHub Actions handles:

- Ruby environment setup
- Running the Jekyll production build
- Syncing `_site/` to the S3 bucket
- CloudFront cache invalidation (instant global updates)

### 3. AWS handles:

- **S3** — static hosting origin
- **CloudFront** — CDN + HTTPS + caching

This combination gives full control without the overhead of an all-in-one service like Amplify.\
It also keeps AWS fundamentals sharp.

---

## 🚀 Local Development

To serve the site locally with autoreload:

```bash
bundle exec jekyll serve --livereload
```

Jekyll will rebuild the site on every file change and serve from `_site/`.

---

## 📦 Deployment (GitHub Actions → S3 → CloudFront)

Commits pushed to `master` automatically trigger the deployment workflow:

1. Install Ruby + Bundler
2. Run `jekyll build`
3. Sync the `_site/` directory to S3
4. Invalidate CloudFront cache

No AWS keys appear in this repository — all credentials are injected securely via **GitHub Secrets**.

---

## 🧰 Tech Stack

- **Jekyll 4.x** — static site generator
- **Ruby 3.3.x** — runtime
- **AWS S3** — object storage + hosting
- **AWS CloudFront** — global CDN + cache
- **GitHub Actions** — automated CI/CD

No Node-based asset pipeline is used here, keeping the project fast, simple, and easy to maintain long-term.

---

## 📁 Key Directories

```
oilstrokes/
├── _includes/          # Reusable components
├── _layouts/           # Jekyll page layouts
├── _site/              # Generated output (ignored)
├── assets/             # Static images, CSS
├── _config.yml         # Jekyll config
├── Gemfile             # Ruby dependencies
└── .github/workflows/  # CI/CD deployment pipeline
```

---

## 📜 Changelog

### 2025-12-01
- Added GitHub Actions deploy pipeline
- Updated documentation and README
- Improved Jekyll config and AWS setup

### 2020-02-21
- Initial launch of oilstrokes.com

---

## 🔒 License

© 2025 Roger Ehmpke. All rights reserved.

This repository is publicly visible for transparency but is not licensed for reuse.\
See the `LICENSE` file for complete details.
