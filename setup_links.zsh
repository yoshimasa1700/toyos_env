#!/bin/zsh
 
for file in dotfiles/*;
do
    onlyfile=${${(s:/:)file}[-1]}
    filepath="${PWD}/${file}"
    homefile="${HOME}/.${onlyfile}"

    if [ ! -e "${homefile}" ]; then
	echo ".${onlyfile} not exis, make symbolic link to ${homefile}"
	ln -s "${filepath}" "${homefile}"
    else
	echo "${onlyfile=} exist"
    fi
done
