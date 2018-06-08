#!/bin/bash

# This will configure siege using defaults and the ENV that you set

CONFIG_FILE="/root/.siege/siege.conf"
echo "# Siege Config" > $CONFIG_FILE

# Set the customizable options
if [ -z "$URL"]; then
    echo "You MUST set the URL env variable!!!!"
    exit 1
fi

if [ -z "$VERBOSE" ]; then VERBOSE=true; fi
if [ -z "$COLOR" ]; then COLOR=on; fi
if [ -z "$PARSER" ]; then PARSER=true; fi
if [ -z "$GMETHOD" ]; then GMETHOD=HEAD; fi
if [ -z "$NOFOLLOW" ]; then NOFOLLOW="ad.doubleclick.net|pagead2.googlesyndication.com|ads.pubsqrd.com|ib.adnxs.com" ; fi
if [ -z "$TIMESTAMP" ]; then TIMESTAMP=true; fi
if [ -z "$FULLURL" ]; then FULLURL=true; fi
if [ -z "$DISPLAY_ID" ]; then DISPLAY_ID=false; fi
if [ -z "$LIMIT" ]; then LIMIT=10; fi
if [ -z "$CACHE" ]; then CACHE=false; fi
if [ -z "$CONNECTION" ]; then CONNECTION=close; fi
if [ -z "$TIME" ]; then TIME=5m; fi
if [ -z "$DELAY" ]; then DELAY=0.25; fi
if [ -z "$TIMEOUT" ]; then TIMEOUT=4; fi
if [ -z "$COOKIES" ]; then COOKIES=false; fi

# Buld the config
echo "url = $URL" >> $CONFIG_FILE
echo "verbose = $VERBOSE" >> $CONFIG_FILE
echo "color = $COLOR" >> $CONFIG_FILE
echo "parser = $PARSER" >> $CONFIG_FILE
echo "gmethod = $GMETHOD" >> $CONFIG_FILE
echo "timestamp = $TIMESTAMP" >> $CONFIG_FILE
echo "fullurl = $FULLURL" >> $CONFIG_FILE
echo "display-id = $DISPLAY_ID" >> $CONFIG_FILE
echo "limit = $LIMIT" >> $CONFIG_FILE
echo "cache = $CACHE" >> $CONFIG_FILE
echo "connection = $CONNECTION" >> $CONFIG_FILE
echo "time = $TIME" >> $CONFIG_FILE
echo "delay = $DELAY" >> $CONFIG_FILE
echo "timeout = $TIMEOUT" >> $CONFIG_FILE
echo "cookies = $COOKIES" >> $CONFIG_FILE

# Non-Customizables
echo "quiet = false" >> $CONFIG_FILE
echo "show-logfile = false" >> $CONFIG_FILE
echo "logging = false" >> $CONFIG_FILE
echo "protocol = HTTP/1.1" >> $CONFIG_FILE
echo "chunked = true" >> $CONFIG_FILE

# Set NOFOLLOW
IFS='|'; echo "" >> $CONFIG_FILE
for addr in $NOFOLLOW; do
    echo "nofollow = $addr" >> $CONFIG_FILE
done

echo ""
echo ""
echo "Done configuring siege.  It will now run....."
echo ""

cat /root/.siege/siege.conf
siege
