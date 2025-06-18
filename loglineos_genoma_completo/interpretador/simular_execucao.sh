#!/bin/sh
TRACE_ID="simulacao-$(date +%s)"
mkdir -p spans
FLOW=$1
OUT="spans/$(basename "$FLOW" .logline).jsonl"
cat "$FLOW" | grep "^call(" | while read -r line; do
  CODE=$(echo "$line" | sed -E 's/call\((.*)\)/\1/')
  SPAN_ID=$(date +%s%N)
  START=$(date -Iseconds)
  # escape any double quotes in the code snippet so the JSON is valid
  CODE_ESC=$(printf '%s' "$CODE" | sed 's/"/\\"/g')
  printf '{"span_id":"%s","trace_id":"%s","type":"call","start":"%s","latency_ms":1,"status":"simulated","code":"%s"}\n' \
    "$SPAN_ID" "$TRACE_ID" "$START" "$CODE_ESC" >> "$OUT"
done
