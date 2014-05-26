obj-m := lab06_dev.o 

KDIR  := /lib/modules/$(shell uname -r)/build
PWD   := $(shell pwd)

modules:
	$(MAKE) -C $(KDIR) M=$(PWD) modules
	sudo insmod lab06_dev.ko
	sudo mknod /dev/lab06 c 250 0
	sudo chmod 666 /dev/test 

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
	sudo rmmod lab06_dev
	sudo rm -rf /dev/lab06
