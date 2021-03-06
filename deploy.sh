#!/bin/zsh

typeset filename=${${(%):-%N}:A:t}
typeset site='https://helpful.wiki'

if ((${#} != 1)) {
	print "${filename}: invalid # of commands" >&2
	exit 1
}

if [[ ${1} == 'before' ]] {
	hugo
} elif [[ ${1} == 'after' ]] {
#	firebase open 'hosting:site'
	open ${site}
} else {
	print -- "${filename}: unrecognized argument ${1}" >&2
	exit 1
}

exit 0
