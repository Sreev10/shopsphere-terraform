output "notification_channel_id" {
  value = google_monitoring_notification_channel.email.name
}

output "vm_cpu_alert_policy_id" {
  value = google_monitoring_alert_policy.vm_cpu.name
}