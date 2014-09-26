# Bugsnag


* has `Bugsnag::MetaData` extension for exceptions
* can add arbitrary metadata to `Bugsnag.notify`
* correctly handles wrapped exceptions
* does not send local_variables (but can be solved by middleware)
