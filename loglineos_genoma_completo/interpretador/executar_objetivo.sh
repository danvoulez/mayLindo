#!/bin/sh
TRACE_ID="exec-$(date +%s)"
mkdir -p spans
FLOW=$1
OUT="spans/$(basename "$FLOW" .logline).jsonl"
cat "$FLOW" | grep "^call(" | while read -r line; do
  CODE=$(echo "$line" | sed -E 's/call\((.*)\)/\1/')
  FUNC=$(echo "$CODE" | sed -E 's/\(.*//')
  START=$(date -Iseconds)
  SPAN_ID=$(date +%s%N)
  STATUS="ok"
  latency=2
  bash "scripts/$FUNC.sh" || STATUS="error"
  echo "{"span_id":"$SPAN_ID","trace_id":"$TRACE_ID","type":"call","start":"$START","latency_ms":$latency,"status":"$STATUS","code":"$CODE"}" >> "$OUT"
done
