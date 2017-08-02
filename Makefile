# Project configuration
NAME=partner-site
VERSION=0.0.14
LOCAL_PORT=3044
GITHUB_USER=filethis
BOWER_NAMESPACE=FileThis

# Project targets
include project-application.make

.PHONY: serve-mkdocs
serve-mkdocs:  ## Serve the documentation using mkdocs
	@mkdocs serve

.PHONY: open-mkdocs
open-mkdocs:  ## Open the served mkdocs documentation in browser
	@open http://127.0.0.1:8000
