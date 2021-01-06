#!/usr/bin/env bash

set -e

SOURCE_FILE="$1"
FORMAT="$2"
RUNS="${3:-10}" # If run-count isn't given, default to 10 runs.

if [ -z "$SOURCE_FILE" ] || [ -z "$FORMAT" ]; then
    echo "Usage: run-bench.sh <source-file-path> <webp/avif> <run-count>"
    exit 1
fi

RUN_COUNTER=$RUNS
TOTAL=0

while [ $RUN_COUNTER -gt 0 ]; do
    TIME=$(node convert.js ${SOURCE_FILE} ${FORMAT})
    TOTAL=$(echo "$TOTAL + $TIME" | bc)
    RUN_COUNTER=$(($RUN_COUNTER-1))
done

echo "Sharp ${SOURCE_FILE} -> ${FORMAT} Conversion (${RUNS} runs)"
AVERAGE=$(echo "scale=10; $TOTAL / $RUNS" | bc)
echo "Average time = ${AVERAGE} ms"
