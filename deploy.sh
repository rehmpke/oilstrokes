#!/bin/bash
set -e

echo "Building Jekyll site…"
bundle exec jekyll build

echo "Syncing to S3…"
aws s3 sync _site/ s3://oilstrokes.com --delete

echo "Invalidating CloudFront…"
aws cloudfront create-invalidation \
  --distribution-id E29PQLXUQLCU8U \
  --paths "/*"

echo "Deployment complete."
