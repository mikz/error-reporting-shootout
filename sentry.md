# Sentry

* does not properly recognize wrapped exceptions
* can pass data when sending custom events or exceptions
* can use Raven.annotate_exception to add custom data to exceptions
* does not send local variables (but advertises so)
* does not handle wrapped exceptions
