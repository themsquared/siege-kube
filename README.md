# Siege for Docker/Kubernetes

This is a containerized version of the the awesome load-testing tool called [Siege](https://www.joedog.org/)

# Environment Variables

This is designed to be configured using environment variables. Very convenient for running inside of Kubernetes as a job with many copies in order to distribute your load testing.

|Variable  |Default|Required?|
|----------|-------|---------|
|URL       |n/a    |yes      |
|VERBOSE   |true   |no       |
|COLOR     |on     |no       |
|PARSER    |true   |no       |
|GMETHOD   |HEAD   |no       |
|TIMESTAMP |true   |no       |
|FULLURL   |true   |no       |
|DISPLAY_ID|false  |no       |
|LIMIT     |10     |no       |
|CACHE     |false  |no       |
|CONNECTION|close  |no       |
|TIME      |5m     |no       |
|DELAY     |0.25   |no       |
|TIMEOUT   |5      |no       |
|COOKIES   |false  |no       |
|NOFOLLOW  |"ad.doubleclick.net|pagead2.googlesyndication.com|ads.pubsqrd.com|ib.adnxs.com"|no|