resource "google_monitoring_notification_channel" "email" {
  display_name = "${var.environment}-monitoring-email"
  type         = "email"
  labels = {
    email_address = var.notification_email
  }
}

resource "google_monitoring_alert_policy" "vm_cpu" {
  display_name = "${var.environment}-vm-high-cpu"
  combiner     = "OR"
  conditions {
    display_name = "VM CPU utilization above 80%"
    condition_threshold {
      filter          = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" AND resource.type=\"gce_instance\""
      comparison      = "COMPARISON_GT"
      threshold_value = 0.8
      duration        = "300s"

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }

  }

  notification_channels = [
    google_monitoring_notification_channel.email.name
  ]

  documentation {
    content = "VM CPU utilization has remained above 80% for 5 minutes."
  }

  alert_strategy {
    auto_close = "1800s"
  }
}