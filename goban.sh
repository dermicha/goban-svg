#!/bin/bash

SIZE=$1
PYTHON=$(which python)

if [[ ${SIZE} == "9" || ${SIZE} == "13" || ${SIZE} == "19" ]]; then
	if [[ ! -d "./.venv3" ]]; then 
		${PYTHON} -m venv .venv3
	fi

	. .venv3/bin/activate
	PYTHON=$(which python)
	PIP=$(which pip)

	${PIP} install --upgrade pip
	${PIP} install -r requirements.txt

	${PYTHON} goban.py --size=${SIZE} --margin=18 --rounded_corners=18 --multlines=3 --output ./go-board_${SIZE}.svg
else
	echo "usage: $0 {9|13|19}"
fi

