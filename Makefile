# make -f Makefile
# This Makefile will rebuild results.txt if its dependencies change
# It will also rebuild processed_data.txt if its dependencies change

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
# python file_to_run.py param1 param2
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

# Why doesnt the "all" target include processed_data.txt?
# the results.txt rule already has a dependency on 
# processed_data.txt which will ensure that processed_data.txt 
# exists before the rule is executed

# Will it still work if you replace processed_data.txt with
# processed_data? No. replacing a file target with a phony target
# will result in the rule being run every time even with no changes
# sample: https://github.com/suitenumerique/docs/blob/main/Makefile
