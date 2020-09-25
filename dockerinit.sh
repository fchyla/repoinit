## template for makefile


TAG		:= $$(git log -1 --pretty=%h)
STAG	:= ft-source-one-smb:${TAG}
PRD_TAG := $$(git describe --tag)

new:
	@docker build -t ${STAG} .
	@docker tag ${STAG} :latest 
