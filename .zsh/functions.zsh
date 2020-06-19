function kctl_logs_first_pod {
    kubectl get pods attr-data-agg-daily-1592541900-7pvtk -o jsonpath='{.spec.containers[*].name}' | awk '{print$1}' | xargs kubectl logs ${1}
}
