function kctl_logs_first_pod {
    kubectl get ${1} -o jsonpath='{.spec.containers[*].name}' | awk '{print$1}' | xargs kubectl logs ${1}
}
