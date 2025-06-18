simulate:
	# Concatenate all loglines ensuring a trailing newline between files
	printf '' > organismos/homeostase_temperatura.logline
	for f in genoma/*.logline; do \
	cat "$$f" >> organismos/homeostase_temperatura.logline; \
	printf '\n' >> organismos/homeostase_temperatura.logline; \
	done
	bash interpretador/simular_execucao.sh organismos/homeostase_temperatura.logline

execute:
	bash interpretador/executar_objetivo.sh organismos/homeostase_temperatura.logline

validate:
	python3 tests/validate_spans.py
