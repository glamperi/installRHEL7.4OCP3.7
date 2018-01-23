export USERNAME=developer
export PASSWORD=developer
export VERSION=v3.7
export IP="$(ip route get 8.8.8.8 | awk '{print $NF; exit}')"
export DOMAIN=${IP}.nip.io
