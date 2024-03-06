#!/bin/bash

DB_FILE=~/scan/DB_file

for file in $( find ~/DATE -perm /u=s ); do
        MD5SUM=$( md5sum ${file} | awk '{print $1}')
        echo "${MD5SUM};$(realpath "${file}")"
        DBCHECK=$( cat $DB_FILE | egrep "^${file}$" | awk -F ";" '{print $1}' )
        echo "${DBCHECK}"


        if [[ 

"$MD5SUM" = "$DBCHECK" ]]; then
                echo "${file} Файл не изменен"
else
                echo "${file} файл изменен"
        fi
                echo "====================================="
done

echo "------------------------------------------------"

# Сканирование на создание файла. Он обнаруживает создан ли файл и сравнивает с базой данных файла.

for file in $( find ~/DATE -perm /u=s ); do
        FILEPATH=$( realpath "${file}" | sort )
        echo "${FILEPATH}"
        DBCHECK=$( cat $DB_FILE | awk -F ";" '{print $3}' | egrep "^${file}$" )
        echo "${DBCHECK}"


        if [[ "$FILEPATH" != "$DBCHECK" ]]; then
                echo "Cоздан файл ${file2}"
        fi
                echo "========================================"
done
