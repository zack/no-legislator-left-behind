# No Legislator Left Behind

Sometimes committees don't do their jobs.

We don't like that.

## Setup

1. Install Ruby 2.4.0
   1. Perhaps using rmv (https://rvm.io)
1. Install Bundler (https://bundler.io)
   1. `gem install bundler`
1. Install everything else
   1. `bundle install`
1. Set up a local database and seed it
   1. `rake db:reseed`

Now you can run `rails c[onsole]` to start playing around with stuff or run
`rails [s]server` and navigate to localhost:3000. All seed data is dumped into
Masshachusetts.
