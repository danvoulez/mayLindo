simulate:
	cat genoma/*.logline > organismos/homeostase_temperatura.logline
	bash interpretador/simular_execucao.sh organismos/homeostase_temperatura.logline

execute:
	bash interpretador/executar_objetivo.sh organismos/homeostase_temperatura.logline

validate:
	python3 tests/validate_spans.py
