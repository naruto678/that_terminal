CXX=g++
CPPFLAGS=-Wall -Wextra
CXXFLAGS=-std=c++17

#CXXFLAGS += -Ofast
CXXFLAGS += -Og -g -fsanitize=address

CPPFLAGS += -Irendering -Itty -I.

CXXFLAGS += $(shell pkg-config sdl2 --cflags)
LDLIBS   += $(shell pkg-config sdl2 --libs)

# for forkpty:
LDLIBS   += -lutil

OBJS=\
	tty/terminal.o \
	tty/forkpty.o \
	beeper.o \
	main.o \
	ctype.o

all: $(OBJS)
	$(CXX) -o $@ $(OBJS) $(CXXFLAGS) $(LDLIBS)
	
	