#!/usr/bin/with-contenv sh

set -e

#User params
TIMEZONE=${TZ:="UTC"}

# Set Timezone
echo "${TIMEZONE}" > /etc/TZ
