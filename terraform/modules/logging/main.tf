resource "google_logging_metric" "application_errors" {
  name        = "${var.environment}-application-errors"
  description = "Counts application error logs."
  filter      = <<-EOT
    severity >= ERROR
    EOT
  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
    labels {
      key         = "severity"
      value_type  = "STRING"
      description = "Log severity"
    }
  }

  label_extractors = {
    severity = "EXTRACT(severity)"
  }
}