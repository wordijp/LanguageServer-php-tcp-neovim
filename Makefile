ifeq ($(OS),Windows_NT)
  TARGET = availableport.exe
else
  TARGET = availableport
endif

# ------------------------------------------------

all:
	make -C src/availableport
release:
	cp -f src/availableport/$(TARGET) bin/$(TARGET) 
clean:
	make clean -C src/availableport
	rm -f bin/$(TARGET)

# ------------------------------------------------

.PHONY: clean
