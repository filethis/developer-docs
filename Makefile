# Running -----------------------------------------------------------------------------------

.PHONY: serve
serve:  ## Serve the documentation locally using mkdocs command
	@mkdocs serve

.PHONY: run
run:  ## Run the documentation locally using mkdocs command
	@open http://127.0.0.1:8000


# GitHub Repository -----------------------------------------------------------------------------------

.PHONY: open-repo
open-repo:  ## Open URL of project GitHub repository page
	@open https://github.com/filethis/developer-docs

.PHONY: url-repo
url-repo:  ## Print URL of project GitHub repository page
	@echo https://github.com/filethis/developer-docs


# Application -----------------------------------------------------------------------------------

.PHONY: open-app
open-app:  ## Open the published documentation in browser
	@open http://filethis-developer.readthedocs.io/en/latest/

.PHONY: url-app
url-app:  ## Print URL of the published documentation
	@echo http://filethis-developer.readthedocs.io/en/latest/;


# Release -----------------------------------------------------------------------------------

.PHONY: release
release:  ## Publish static files in GitHub Pages for this project
	@xxxx;

.PHONY: publish-github-pages
publish-github-pages: build-app
	@bin_dir="$$(dirname `which gh-pages`)"; \
	parent_dir="$$(dirname $$bin_dir)"; \
	lib_dir=$$parent_dir/lib; \
	rm -rf $$lib_dir/node_modules/gh-pages/.cache; \
	gh-pages \
		--repo https://github.com/filethis/${NAME}.git \
		--branch gh-pages \
		--silent \
		--dist ./build/default; \
	echo Published version ${VERSION} of application \"${NAME}\" to GitHub Pages at https://filethis.github.io/${NAME};


# Help -----------------------------------------------------------------------------------

.PHONY: help
help:  ## Print Makefile usage. See: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help