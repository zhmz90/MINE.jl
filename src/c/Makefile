PLATFORM := $(shell uname -s)
ifeq "$(PLATFORM)" "Darwin"
libmine: libmine.dylab
CC := clang
else
libmine: libmine.so
CC := gcc
endif

libmine.so: mine.c mine.h
	$(CC) mine.c mine.h -fpic -shared -o libmine.so
libmine.dylab: mine.c mine.h
	$(CC) mine.c mine.h -dynamiclib -o libmine.dylab
clean:
	rm -rf *.so *.dylab
