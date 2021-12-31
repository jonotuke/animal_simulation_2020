all:
	Rscript -e "targets::tar_make()"
	open Notes.html

clean:
	Rscript -e "targets::tar_destroy()"
