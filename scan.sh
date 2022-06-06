TARGET=$1
if ! [ $TARGET ]; then
  echo "[!] No target provided."
  echo ">> $0 <att-domains@att.com>"
  exit 1
fi
knockknock -n $TARGET
subfinder -dL domains.txt -silent | anew -q targets.txt
cat targets.txt | httprobe > probed.txt
nuclei -list probed.txt -o final.txt
