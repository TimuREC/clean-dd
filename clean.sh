#! /bin/sh

PROJ="$(find . -d 1 -name *.xcodeproj | cut -d/ -f2)"

if [[ -n PROJ ]]; then
	DDPATH="$(xcodebuild -project $PROJ -showBuildSettings | grep -e " BUILT_PRODUCTS_DIR*" | cut -d= -f2 | xargs | sed -e "s!\(.*\)\($(echo $PROJ | cut -d. -f1)-[a-z]*\/\)\(.*\)!\1\2!")"
	rm -rf Pods
	rm -rf $DDPATH
	echo "Pods cache and DerivedData path for $PROJ cleaned"
else
	echo "Project not found"
fi
