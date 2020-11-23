all:
	Rscript -e "targets::tar_make()"
	open "reports/simulation_notes.html"
	
clean:	
	Rscript -e "targets::tar_destroy()"
