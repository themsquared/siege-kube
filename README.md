# Siege for Docker/Kubernetes

This is a containerized version of the the awesome load-testing tool called [Siege](https://www.joedog.org/)

## Config - Environment Variables

This is designed to be configured using environment variables. Very convenient for running inside of Kubernetes as a job with many copies in order to distribute your load testing.

|Variable  |Default    |Required?  |Description|
|----------|-----------|-----------|-----------|
|URL       |n/a        |yes        |the url to siege|
|VERBOSE   |true       |no         |show output on stdou (recommended true)|
|COLOR     |on         |no         |colorized output|
|PARSER    |true       |no         |true downloads css,js,etc.|
|TIMESTAMP |true       |no         |show timestamp in output|
|FULLURL   |true       |no         |display full URL in output|
|DISPLAY_ID|false      |no         |show siege user id in verbose mode|
|LIMIT     |10         |no         |max number of threads|
|CACHE     |false      |no         |respect caching|
|CONNECTION|close      |no         |what to do with the connection when complete|
|TIME      |5m         |no         |amount of time to run the siege|
|DELAY     |0.25       |no         |how long between requests|
|TIMEOUT   |5          |no         |timeout of requests|
|COOKIES   |false      |no         |keep cookies?|
|FAILURES  |100        |no         |number of failures before quitting|
|USER_AGENT|SiegeDocker|no         |the user agent string of the siege|
|CONCURRENT|10         |no         |number of concurrent siege users|
|BENCHMARK |false      |no         |true sets  the delay to 0|
|FOLLOW_REDIRECTS|true |no         |should requests follow redirects|
|NOFOLLOW  |"ad.doubleclick.net"|no|redirect urls to ignore separated by pipes|

## Usage

### Local

From here, try this:

`docker run -it --rm  --env TIME=5s --env URL=example.com --env PARSER=false sudermanjr/siege:4.0.4`

### Kubernetes

There is an example `job.yaml` that shows how to run 10 of these at once.  Use that as a baseline to build your own load test.

Once each job completes, you can get the summary of the run like so:

```
SIEGE_PODS=$(kubectl get po | grep siege | awk '{print $1}')
for pod in $SIEGE_PODS; do echo $pod && kubectl logs $pod | grep Transactions -A12; done
```

## How it Works

### run.sh

This script sets up the config file in /root/.siege/siege.conf and then runs siege.  By default it displays to stdout for docker logging to capture it.
