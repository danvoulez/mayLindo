import json
with open('spans/homeostase_temperatura.jsonl') as f:
  for line in f:
    span = json.loads(line)
    for field in ['span_id','trace_id','type','start','latency_ms','status','code']:
      assert field in span
print("OK")
