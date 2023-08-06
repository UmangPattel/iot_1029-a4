ifdef DEBUG
    DEBUGFLAGS = -g
else
    DEBUGFLAGS =
endif

TARGET  := a.out
SRC     := $(wildcard *.s)
OBJS    := $(SRC:%.s=%.o)

%.o: %.s
    arm-linux-gnueabi-as $(DEBUGFLAGS) $< -o $@

$(TARGET): $(OBJS)
    arm-linux-gnueabi-ld -o $(TARGET) $(OBJS)

clean:
    -@rm $(TARGET)
    -@rm $(OBJS)
