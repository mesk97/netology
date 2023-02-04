#HEADERS = program.h headers.h
PROGRAMS := alloc_rss alloc_shared alloc_virt

#%.o: %.c
#	gcc -c $< -o $@

#program: $(OBJECTS)
#	gcc $(OBJECTS) -o $@

all: $(PROGRAMS)

$(PROGRAMS):
	gcc $@.c -o $@

clean:
	-rm -f $(PROGRAMS)
