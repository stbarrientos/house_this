House This
==========

You can see House This [here](http://housethis.herokuapp.com/)

To get House This running on your machine:

`git clone`
`bundle install`
`rake db:create`
`rake db:migrate`
`rake db:seed`

This will enusre you have the latest version on GitHub and that your database will be ready to go.

To run the test suite:
`rspec`

About
=====

House This is an application designed to make collaborating with roommates to search for a place live easy. It compiles a list of potential places by having the user either type in the data to a form manual or by screenscraping a url.
Currently, the site only supports scraping with Zillow, but plan to add support for other sites soon.
