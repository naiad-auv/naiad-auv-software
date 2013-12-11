# Makefile for NaiAda
#
#

OBJDIR = ./obj/
SRCDIR = ./src/
INCDIR = ./src/
BINDIR = ./

TARGET = $(BINDIR)naiada
PARSER_SPEC = $(SRCDIR)naiada.y
PARSER_SRC = $(PARSER_SPEC).c
PARSER_H = $(PARSER_SPEC).h
SCANNER_SPEC = $(SRCDIR)naiada.l
SCANNER_SRC = $(SCANNER_SPEC).c

C_SOURCES  = $(wildcard $(SRCDIR)*.c)
ifneq ($(findstring $(SCANNER_SRC), $(C_SOURCES)), $(SCANNER_SRC))
  C_SOURCES += $(SCANNER_SRC)
endif
ifneq ($(findstring $(PARSER_SRC), $(C_SOURCES)), $(PARSER_SRC))
  C_SOURCES += $(PARSER_SRC)
endif
OBJECTS = $(subst .c,.o,$(subst $(SRCDIR),$(OBJDIR),$(C_SOURCES)))
INTERMEDIATE_FILES = $(OBJDIR)*.o $(OBJDIR)*.d $(TARGET) $(SCANNER_SRC) $(PARSER_SRC) $(PARSER_H)
DEPFILES = $(patsubst $(SRCDIR)%.c,$(OBJDIR)%.d,$(C_SOURCES))
CC = gcc
YACC = bison
LEX = flex

CFLAGS += -Wall

# LFLAGS += -g
# CFLAGS += -g

LINK = $(CC) $(LFLAGS) -o $@ $^
COMPILE = $(CC) -I$(INCDIR) $(CFLAGS) -o $@ -c $<

vpath %.c $(SRCDIR)
vpath %.o $(OBJDIR)

.PHONY: clean all

all: $(TARGET)

include $(DEPFILES)

$(OBJDIR)%.d: $(SRCDIR)%.c
	set -e; $(CC) -MM -MG $(CFLAGS) -I$(INCDIR) $< \
	| sed -n -e "sW\($*\)\.o[ :]*W$(OBJDIR)\1.o $@ : Wg" -e "p" > $@

$(TARGET): $(OBJECTS)
	$(LINK)

$(OBJDIR)%.o: $(SRCDIR)%.c $(OBJDIR)%.d
	$(COMPILE)

$(PARSER_SRC): $(PARSER_SPEC)
	$(YACC) -d -o $(PARSER_SRC) $(PARSER_SPEC)

$(SCANNER_SRC): $(SCANNER_SPEC)
	$(LEX) -o$(SCANNER_SRC) $(SCANNER_SPEC)

clean:
	-rm -fv $(INTERMEDIATE_FILES)
	-rm -fv *~

