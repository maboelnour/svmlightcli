#
# makefile for svm_light 
#
# Thorsten Joachims, 2002
#

#Use the following to compile under unix or cygwin
CC = gcc
LD = gcc

#Uncomment the following line to make CYGWIN produce stand-alone Windows executables
#SFLAGS= -mno-cygwin

#CFLAGS=  $(SFLAGS) -ggdb3 -O0 -pg -Wall -pedantic                     # release C-Compiler flags
CFLAGS=  $(SFLAGS) -O3                     # release C-Compiler flags
#LFLAGS=  $(SFLAGS) -O0 -pg                     # release linker flags
LFLAGS=  $(SFLAGS) -O3                     # release linker flags
#CFLAGS= $(SFLAGS) -pg -Wall -pedantic      # debugging C-Compiler flags
#LFLAGS= $(SFLAGS) -pg                      # debugging linker flags
LIBS=-L. -lm #-lsvmlight                               # used libraries
SRC_DIR=.
BIN_DIR=../../bin

all: svm_learn_hideo svm_classify

tidy: 
	rm -f ./*.o

clean:	tidy
	rm -f ./svm_learn
	rm -f ./svm_classify
	rm -f ./libsvmlight.so

help:   info

info:
	@echo
	@echo "make for SVM-light               Thorsten Joachims, 1998"
	@echo
	@echo "Thanks to Ralf Herbrich for the initial version."
	@echo 
	@echo "USAGE: make [svm_learn | svm_learn_loqo | svm_learn_hideo | "
	@echo "             libsvmlight_hideo | libsvmlight_loqo | "
	@echo "             svm_classify | all | clean | tidy]"
	@echo 
	@echo "    svm_learn           builds the learning module (prefers HIDEO)"
	@echo "    svm_learn_hideo     builds the learning module using HIDEO optimizer"
	@echo "    svm_classify        builds the classfication module"
	@echo "    libsvmlight_hideo   builds shared object library that can be linked into"
	@echo "                        other code using HIDEO"
	@echo "    all (default)       builds svm_learn + svm_classify"
	@echo "    clean               removes .o and target files"
	@echo "    tidy                removes .o files"
	@echo

# Create executables svm_learn and svm_classify

svm_learn_hideo: svm_learn_main.o svm_learn.o svm_common.o svm_hideo.o 
	$(LD) $(LFLAGS) svm_learn_main.o svm_learn.o svm_common.o svm_hideo.o -o svm_learn $(LIBS)

svm_classify: svm_classify.o svm_common.o 
	$(LD) $(LFLAGS) svm_classify.o svm_common.o -o svm_classify $(LIBS)


# Create library libsvmlight.so, so that external code can get access to the
# learning and classification functions of svm-light by linking this library.

svm_learn_hideo_noexe: svm_learn_main.o svm_learn.o svm_common.o svm_hideo.o 

libsvmlight_hideo: svm_learn_main.o svm_learn.o svm_common.o svm_hideo.o 
	$(LD) -shared svm_learn.o svm_common.o svm_hideo.o -o libsvmlight.so

#svm_learn_loqo_noexe: svm_learn_main.o svm_learn.o svm_common.o svm_loqo.o loqo

# Compile components

svm_hideo.o: $(SRC_DIR)/svm_hideo.c
	$(CC) -c $(CFLAGS) $(SRC_DIR)/svm_hideo.c -o svm_hideo.o 

svm_common.o: $(SRC_DIR)/svm_common.c $(SRC_DIR)/svm_common.h $(SRC_DIR)/kernel.h
	$(CC) -c $(CFLAGS) $(SRC_DIR)/svm_common.c -o svm_common.o 

svm_learn.o: $(SRC_DIR)/svm_learn.c $(SRC_DIR)/svm_common.h
	$(CC) -c $(CFLAGS) $(SRC_DIR)/svm_learn.c -o svm_learn.o 

svm_learn_main.o: $(SRC_DIR)/svm_learn_main.c $(SRC_DIR)/svm_learn.h $(SRC_DIR)/svm_common.h
	$(CC) -c $(CFLAGS) $(SRC_DIR)/svm_learn_main.c -o svm_learn_main.o 

svm_classify.o: $(SRC_DIR)/svm_classify.c $(SRC_DIR)/svm_common.h $(SRC_DIR)/kernel.h
	$(CC) -c $(CFLAGS) $(SRC_DIR)/svm_classify.c -o svm_classify.o

install: svm_learn_hideo svm_classify
	cp svm_learn $(BIN_DIR)/svm_learn_native
	cp svm_classify $(BIN_DIR)/svm_classify_native
		
