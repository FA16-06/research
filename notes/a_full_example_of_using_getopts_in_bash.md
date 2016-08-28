# A full example of using getopts in Bash

Tags: bash getopts snippet

Created: 2016-08-24 10:52:22

[linux - example of how to use getopts in bash - Stack Overflow](http://stackoverflow.com/questions/16483119/example-of-how-to-use-getopts-in-bash)
<<<<<<< HEAD
([local](http://localhost:8889/stackoverflow.com/questions/16483119/example-of-how-to-use-getopts-in-bash.html))
=======
>>>>>>> 568b594ae01d0fffed81476c27c85cbe037d2148

```bash
usage() { echo "Usage: $0 [-s <45|90>] [-p <string>]" 1>&2; exit 1; }

while getopts ":s:p:" o; do
    case "${o}" in
        s)
            s=${OPTARG}
            ((s == 45 || s == 90)) || usage
            ;;
        p)
            p=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${s}" ] || [ -z "${p}" ]; then
    usage
fi

echo "s = ${s}"
echo "p = ${p}"
```
