CC=g++
CDEFINES=
SOURCES=Dispatcher.cpp Mode.cpp precomp.cpp profanity.cpp SpeedSample.cpp
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=profanity2.x64

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	LDFLAGS=-framework OpenCL
	CFLAGS=-c -std=c++11 -Wall -mmmx -O2
else
	LDFLAGS=-s -L"D:/CUDA-Toolkit/lib/x64" -lOpenCL -mcmodel=large
	CFLAGS=-c -std=c++11 -Wall -mmmx -O2 -mcmodel=large -I"D:/CUDA-Toolkit/include"
endif

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $(CDEFINES) $< -o $@

clean:
	rm -rf *.o

