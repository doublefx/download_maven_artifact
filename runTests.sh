#!/usr/bin/env bash
set -e

USAGE="Usage: `basename $0` options -d to debug, -k to keep the docker containers at the end of the tests.";
ANSIBLE_OPTION=""
MOCLECULE_OPTION=""
DESTROY=true

OPTIND=1
while getopts ":dkh" option; do
    case "${option}" in
        d)  ANSIBLE_OPTION=-vvv
            MOCLECULE_OPTION=--debug;;
        k)  DESTROY=false;;
        h)  echo $USAGE
            exit;;
       \?)  echo "Invalid option: -$OPTARG" >&2
            echo $USAGE
            exit 1;;
    esac
done

ansible-playbook tests/fixtures/startArtifactory.yml ${ANSIBLE_OPTION}
molecule ${MOCLECULE_OPTION} test --destroy never

if (( ${DESTROY} )) ; then
    . ./stopTests.sh
fi