#!/bin/bash -x

applet="scheduler"
config="/srv/kubernetes/kube-${applet}/kubeconfig"
master="kube-apiserver.weave.local"

weave_ip=$(hostname -i)

args=(
  --address="${weave_ip}"
  --logtostderr="true"
)

if [ -f $config ]
then
  args+=( --kubeconfig="${config}" )
else
  args+=( --master="http://${master}:8080" )
fi

exec /hyperkube ${applet} "${args[@]}"
