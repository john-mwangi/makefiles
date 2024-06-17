# make -f Makefile

# Define variables for directories
DATADIR = data
SCRIPTDIR = scripts

# Declare the all target
all: $(DATADIR)/results.txt

# Rule to create processed_data.txt from input_data.txt
$(DATADIR)/processed_data.txt: $(DATADIR)/input_data.txt $(SCRIPTDIR)/process_data.py $(SCRIPTDIR)/utils.py
	@echo "Processing data..."
	python $(SCRIPTDIR)/process_data.py $< $@

# below is the syntax for creating a rule:
# {target_file}: {dependency_file_1} {dependency_file_2} {dependency_file_3}
# @echo "print something to the terminal"
# python file_to_run param1 param2
# how do we get param1 and param2 variables?
# $< means the first dependency i.e. dependency_file_1
# $@ means the target i.e. target_file


# Rule to create results.txt from processed_data.txt
$(DATADIR)/results.txt: $(DATADIR)/processed_data.txt $(SCRIPTDIR)/analyse_data.py $(SCRIPTDIR)/utils.py
	@echo "Analyzing data..."
	python $(SCRIPTDIR)/analyse_data.py

# Clean the data directory
clean:
	rm -f $(DATADIR)/*.txt
