#!/bin/sh -l

# Use INPUT_<INPUT_NAME> to get the value of an input
GREETING="Hello, $INPUT_WHO_TO_GREET!"

# Use workflow commands to do things like set debug messages
echo "::notice file=entrypoint.sh,line=7::$GREETING"

# Write outputs to the $GITHUB_OUTPUT file
# echo "time=$(date)" >>"$GITHUB_OUTPUT"

if [ -z "$GITHUB_OUTPUT" ]; then
  echo "GITHUB_OUTPUT is not set; cannot write outputs" >&2
else
  mkdir -p "$(dirname "$GITHUB_OUTPUT")" 2>/dev/null || true
  # attempt to grant write permission (may fail if not allowed)
  chmod u+w "$(dirname "$GITHUB_OUTPUT")" 2>/dev/null || true
  echo "time=$(date)" >>"$GITHUB_OUTPUT"
fi

exit 0
