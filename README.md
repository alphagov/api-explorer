## GOV.UK Api Explorer

The code behind http://govuk-api.heroku.com

This is a simple rack and javascript application to help people begin to explore the GOV.UK Content API.

To run it locally call

> rackup

and then you'll be able to access it at http://localhost:9292/

Most of the work is done in javascript, but rack allows us to proxy the requests to GOV.UK, getting around cross-domain javascript restrictions.