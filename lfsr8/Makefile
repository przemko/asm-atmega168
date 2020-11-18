DEVICE     = m168
CLOCK      = 8000000
PROGRAMMER = -c usbasp -P /dev/tty.usbmodem1421
OBJECTS    = main.o
FUSES      = -U hfuse:w:0xd9:m -U lfuse:w:0x24:m

AVRDUDE = avrdude $(PROGRAMMER) -p $(DEVICE)
COMPILE = avr-as -Wall -mmcu=atmega168
LINK    = avr-gcc 

# symbolic targets:
all:	main.hex

.s.o:
	$(COMPILE)  $< -o $@

flash:	all
	$(AVRDUDE) -U flash:w:main.hex:i

clean:
	rm -f main.hex main.elf $(OBJECTS) *~

main.elf: $(OBJECTS)
	$(LINK) -o main.elf $(OBJECTS)

main.hex: main.elf
	rm -f main.hex
	avr-objcopy -j .text -j .data -O ihex main.elf main.hex
	avr-size --format=avr --mcu=$(DEVICE) main.elf
