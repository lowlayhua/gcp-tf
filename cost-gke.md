# GKE Costs

## PodDisruptionBudget
```
kind: PodDisruptionBudget
spec:
  minAvailable: 3
```
* Note: Vertical Pod Autoscaling should not be used alongside Horizontal Pod Autoscaling on CPU or memory. Both autoscalers will try to respond to changes in demand on the same metrics and conflict. However, VPA on CPU or memory can be used with HPA on custom metrics to avoid overlap.

# HPA: Scale pods with Horizontal Pod Autoscaling
This autoscale command will configure a Horizontal Pod Autoscaler that will maintain between 1 and 10 replicas of the pods controlled by the php-apache deployment. The cpu-percent flag specifies 50% as the target average CPU utilization of requested CPU over all the pods. 
HPA will adjust the number of replicas (via the deployment) to maintain an average CPU utilization of 50% across all pods.
- `kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10`
- `kubectl get hpa`
## 
# Monitoring GKE cost
