# URL SHORTNER

A url shortner is a service that produces aliases for long URLs, commonly referred to as short links.
When clicking on a short link you are dfirected to the original url.

We need to store the shortened URL
Provide unique ids for each URL
Store frequent URL related requests to serve the mefficiently
Limit the number of incoming requests

REQUIREMENTS
short url creation: Our service should be able to generate a unique shorter alias of the given url
Redirection: given a short link our system should be able to redirect the user to the original URL
Custom short links: Users should be able to generate custom short links for their URLs using our system
Deletion: Users should be able to delete a short url generated by our system
Update: users should be able to update the long url associated with the short link, given the proper rights
Expiry time: Therer must be a defualt expiration time for the short links, but users should be able to set the expiration time

NON FUNCTIONAL REQUIREMENTS
Availability: our system should be highly available, since we redirect from the short urls
Scalability: Our system should be horizontally scaling
Readability: The short links should be easily readable, typable, and distinguishable
Latency: The system should perform at low latency to provide a smooth experience
Unpredictability: For security reasons the short urls generated should be unpredictable

RESOURCE ESTIMATION
important part of system design


COMPONENTS
database: will use monolith rostgresql database
Sequencer: Will provide unique IDs that will serve as the starting point for each short url
Load Balancer: will ensure smooth requests to servers
Caches: Will user redis, will store the most frequently used short urls
Rate Limiters: Again use redis, will be used to avoid system exploitation
Base-58 encoder: to transform the sequencers numeric output to a more readable and alphanumeric form
  (basically the sequencer create a unique id for the short url and the encoder makes it readable)


To expose the functionality of our service we can make it an API
endpoints for: shortening a url
redirecting a short url
deleting a short url

shortening
parameters: api_dev_key, original_url, custom_alias=NONE, expiry_date=NONE
returns: the shortened url

Redirecting:
parameters: api_dev_key, url_key (short url)
returns: redirects user to the original url

Deleting:
parameters: api_dev_key, url_key (short url)
returns a message


Database:
storing: user details, mappings of urls

URL generator:
comprised of sequencer to generate unique ids: generate 64 bit numeric ids
comprised of base-58 encoder to enhance readability of short url
need to generate 64 bit alphanumeric short urls in base-58
give the 64 bit numeric id (base-10) to the base-58 encoder


WORKFLOW
generate url, return it
redirect to long irl when given short url
can also generate custom urls