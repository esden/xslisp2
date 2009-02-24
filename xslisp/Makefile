
INCLUDEDIR=../brickos-xs/include
LIBDIR=../brickos-xs/lib
TOOLPREFIX=/usr/bin/h8300-hitachi-coff-
TOOLDIR=/usr/lib/brickos
RCXADDR ?= 0

UTILS=./utils
UTILOBJS=ircom.o $(UTILS)/rcxtty.o $(UTILS)/keepalive.o lnp.o

STACKSIZE=1024
#STACKSIZE=512

KERNEL = ../brickos-xs/boot/brickOS

#OPTIONS=-DDEBUG
#OPTIONS=-DLISTLIB
OPTIONS=

all: ircom.o xs xs0 xs1 xs2 eval.lx eval1 eval2.lx

ircom.o: ircom.c
	gcc -o ircom.o -O2 -Wall -O2 -Wall -I$(UTILS) -I$(INCLUDEDIR)/lnp -c ircom.c

lnp.o: lnp.c
	gcc -o $@ -O2 -Wall -O2 -Wall -I$(UTILS) -I$(INCLUDEDIR)/lnp -c lnp.c

xs0: front.c eval.c object.h include.h test.c wtobj.c errmsg.c
	gcc -o xs0 -DJOINT -DONLINE -DSTACKSIZE=$(STACKSIZE) $(OPTIONS) front.c eval.c

xs1: front.c object.h include.h test.c wtobj.c errmsg.c
	gcc -o xs1 $(OPTIONS) front.c

eval1: eval.c object.h test.c wtobj.c
	gcc -o eval1 -DSTACKSIZE=$(STACKSIZE) $(OPTIONS) eval.c

xs2: front.c object.h include.h test.c wtobj.c
	gcc -o xs2 -DRCX $(OPTIONS) front.c

xs: front.c object.h include.h test.c wtobj.c errmsg.c $(UTILOBJS)
	gcc -g -o xs -DRCX -DIRCOM -DONLINE $(OPTIONS) front.c $(UTILOBJS) -O2 -Wall -I. -I$(INCLUDEDIR)/lnp -I$(UTILS)

eval.lx: eval.c object.h rcxtest.c xsout1
	$(TOOLPREFIX)gcc -DRCX -DIRCOM -DONLINE -DSTACKSIZE=$(STACKSIZE) $(OPTIONS) -Os -fno-builtin -fomit-frame-pointer -Wall -I$(INCLUDEDIR) -I$(INCLUDEDIR)/lnp -I. -c eval.c -o eval.o
	$(TOOLPREFIX)ld -T $(KERNEL).lds -relax -L$(LIBDIR) eval.o  -lc -lmint -lfloat -lc++ -o eval.dc1 --oformat coff-h8300 -Ttext 0xb000
	$(TOOLPREFIX)objcopy -I coff-h8300 -O symbolsrec eval.dc1 eval.ds1
	$(TOOLPREFIX)ld -T $(KERNEL).lds -relax -L$(LIBDIR) eval.o  -lc -lmint -lfloat -lc++ -o eval.dc2 --oformat coff-h8300 -Ttext 0xb210
	$(TOOLPREFIX)objcopy -I coff-h8300 -O symbolsrec eval.dc2 eval.ds2
	$(TOOLDIR)/makelx --display eval.ds1 eval.ds2 eval.lx
	rm eval.o eval.ds1 eval.ds2 eval.dc1 eval.dc2

eval2.lx: eval.c object.h rcxtest.c
	$(TOOLPREFIX)gcc -DRCX -DSTACKSIZE=$(STACKSIZE) $(OPTIONS) -Os -fno-builtin -fomit-frame-pointer -Wall -I$(INCLUDEDIR) -I$(INCLUDEDIR)/lnp -I. -c eval.c -o eval2.o
	$(TOOLPREFIX)ld -T $(KERNEL).lds -relax -L$(LIBDIR) eval2.o  -lc -lmint -lfloat -lc++ -o eval2.dc1 --oformat coff-h8300 -Ttext 0xb000
	$(TOOLPREFIX)objcopy -I coff-h8300 -O symbolsrec eval2.dc1 eval2.ds1
	$(TOOLPREFIX)ld -T $(KERNEL).lds -relax -L$(LIBDIR) eval2.o  -lc -lmint -lfloat -lc++ -o eval2.dc2 --oformat coff-h8300 -Ttext 0xb210
	$(TOOLPREFIX)objcopy -I coff-h8300 -O symbolsrec eval2.dc2 eval2.ds2
	$(TOOLDIR)/makelx -s$(STACKSIZE) eval2.ds1 eval2.ds2 eval2.lx
	rm eval2.o eval2.ds1 eval2.ds2 eval2.dc1 eval2.dc2

clean:
	rm -f xs xs0 xs1 xs2 eval.lx eval2.lx eval1 *.o utils/*.o

upload: eval.lx
	[ -c /dev/usb/legousbtower0 ] && usb_tty="--tty=/dev/usb/legousbtower0" ; dll $$usb_tty --rcxaddr=$(RCXADDR) $^

firmware:
	[ -c /dev/usb/legousbtower0 ] && usb_tty="--tty=/dev/usb/legousbtower0" ; firmdl3 $$usb_tty $(KERNEL).srec; dll --node=$(RCXADDR)

repl: xs
	[ -c /dev/usb/legousbtower0 ] && usb_tty="--tty=/dev/usb/legousbtower0" ; rlwrap ./xs --rcxaddr=$(RCXADDR) $$usb_tty
