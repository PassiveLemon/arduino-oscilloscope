# Used to keep Arduino stuff contained in this repository
CONFIG = --config-file ./arduino-cli.yaml

SKETCH = arduino-oscilloscope
LIBRARIES = U8g2

FQBN = --fqbn arduino:avr:micro
PORT = --port /dev/serial/by-id/usb-Arduino_LLC_Arduino_Micro-if00

setup:
	arduino-cli lib install $(LIBRARIES) $(CONFIG)

compile:
	arduino-cli compile $(SKETCH) $(CONFIG) $(FQBN)

upload: compile
	while true; do \
		arduino-cli upload $(SKETCH) $(CONFIG) $(FQBN) $(PORT) && break; \
		sleep 0.2; \
	done

