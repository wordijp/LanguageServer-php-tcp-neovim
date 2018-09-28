ifeq ($(OS),Windows_NT)
  TARGET = availableport.exe
else
  TARGET = availableport
endif

LDFLAGS := -w -s

SRCS	= main.go

# ------------------------------------------------

all: $(TARGET)

$(TARGET): $(SRCS)
	go build -ldflags "$(LDFLAGS)" -o $@
	@chmod a+x $@

clean:
	rm -f $(TARGET)
	
# ------------------------------------------------

.PHONY: clean
