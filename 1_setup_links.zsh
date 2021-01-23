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
	if [ -L "${homefile}" ]; then
	    echo "link .${onlyfile} exis, remove this link and create new link."
	    rm ${homefile}
	else
	    echo ".${onlyfile} exis, move file to old and create link."
	    mkdir -p ${HOME}/old
	    cp -r "${homefile}" ${HOME}/old && rm -R "${homefile}"
	fi
	ln -s "${filepath}" "${homefile}"
    fi
done
