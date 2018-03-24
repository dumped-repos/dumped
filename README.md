# Dumped

Welcome to your new Hanami project!

## Setup

How to run tests:

```
% bundle exec rake
```

How to run the development console:

```
% bundle exec hanami console
```

How to run the development server:

```
% bundle exec hanami server
```

How to prepare (create and migrate) DB for `development` and `test` environments:

```
% bundle exec hanami db prepare

% HANAMI_ENV=test bundle exec hanami db prepare
```

To import all Github repos that are looking for a maintainer:

```
% bundle exec ruby db/seed
```

**Attention:** This might take a while approx 10 minutes, how the seed works it will use Github api to search for repos that have looking for maintainers in the `README`. It will do it recursively, and will sleep the process when reaching the limit of public calls.

Explore Hanami [guides](http://hanamirb.org/guides/), [API docs](http://docs.hanamirb.org/1.2.0.beta2/), or jump in [chat](http://chat.hanamirb.org) for help. Enjoy! 🌸
