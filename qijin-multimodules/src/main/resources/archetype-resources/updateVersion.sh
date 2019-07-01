
function usage(){
    echo "Usage: sh updateVersion.sh 1.0.1"
    echo "\tWarnning! suffix 'SNAPSHOT' is not needed"
    exit 1
}

function check_param(){
    if [ $# -lt 1 ];then
        usage
    fi
    version=$1
    res=`echo $version | grep "^\d\{1,2\}\.\d\{1,2\}\.\d\{1,2\}$"`
    if [ ! -n "$res" ];then
        usage
    fi
}

check_param $@

version=$1

snapshot_version=$version-SNAPSHOT

echo "new version is: $snapshot_version"

mvn versions:set -DnewVersion=$snapshot_version

