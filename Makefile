# Copyright 2010, jimmikaelkael <jimmikaelkael@wanadoo.fr>
# Licenced under Academic Free License version 3.0

EE_BIN = ps2-protokernel-patch.elf
EE_OBJS = main.o

EE_CFLAGS = -D_EE -O2 -G0 -Wall
EE_LDFLAGS = -nostartfiles -Tlinkfile -s

%.o : %.S
	$(EE_CC) $(EE_CFLAGS) -c $< -o $@

$(EE_BIN) : $(EE_OBJS)
	$(EE_CC) $(EE_CFLAGS) $(EE_LDFLAGS) -o $(EE_BIN) $(EE_OBJS) -Xlinker -Map -Xlinker ps2-protokernel-patch.map

all: $(EE_BIN)

clean:
	rm -f *.o *.a *.map *.bak *.elf

clean_all:
	rm -f *.o *.a *.map *.bak *.elf

include $(PS2SDK)/samples/Makefile.pref

