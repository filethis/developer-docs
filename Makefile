# Project configuration
NAME=partner-site
VERSION=0.0.9
LOCAL_PORT=3044
GITHUB_USER=filethis
BOWER_NAMESPACE=FileThis

# Project targets
include project-application.make

.PHONY: bower-register-public
bower-register-public:  ## Register element in public Bower registry
	@bower Project ${NAME} is private;
