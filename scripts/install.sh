cur=$PWD
for dir in */
do
    if [ $dir == "bin/" ]
    then
        continue
    fi
    echo
    echo "Compiling $dir"
    path="$PWD/$dir"
    cd "${path}"
    sh install.sh
    cd -
done


echo
echo "Done"
