# README

The goal is this repo is to complement performance regression investigation in
https://github.com/AlchemyCMS/alchemy_cms/issues/2468 to compare the SQL query behavior between Alchemy 6.0.5 and 6.0.6.

6.0.6 added eager loading at the controller via https://github.com/AlchemyCMS/alchemy_cms/pull/2313.

This may optimize query performance if (fragment) cache is empty, but the eager loading still occurs when the fragment
cache is warm - thus reducing the performance of otherwise-cached pages.

The `main` branch is on 6.0.5. Check out the `6.0.6` branch to compare performance.

Debug logging is enabled for production mode. If you start with a clean cache, you can fetch `/` first and
count how many SELECT statements appear in the logs without caching. You can then fetch again to compare with a warmed
cache.

```bash
# Clear cache for a clean start
bundle exec rake tmp:cache:clear
# Run in prod mode
RAILS_ENV=production rails assets:precompile
RAILS_ENV=production RAILS_SERVE_STATIC_FILES=true RAILS_LOG_TO_STDOUT=true bin/rails server -p 3020

# In a separate terminal, fetch the page once with a cold cache and check the logs
curl localhost:3020

# And again, we'll see what happens with a warmed cache
curl localhost:3020
```
