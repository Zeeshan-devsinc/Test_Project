# README

### The Book Library application

The application is a simple Billing and Payment application that allows a user to add and remove Plan Subscriptions from their Subscriptions.Accessing a Plan is only possible if a user is subscribed. In this application user must first login for viewing Plans available. User can subscribe a Plan after viewing its complete details.

A user is presented with buttons for adding a plan to their library. As you can guess, to do this action a user first needs an account. Upon clicking the "Subscribe" button a public facing user is redirected to a payment page for payment for repective plan.

A nice callback function from Devise allows us to redirect a user upon successfully signing up. In this case, we redirect a user to a availavle plans page which features different plans to choose from. Each plan has its own parameters associated with it. Upon clicking the "subscribe" button on any of the tiers, the user is redirected to a payment page carrying over the necessary parameters to hook into Stripe with.
