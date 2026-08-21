resource "google_compute_global_address" "load_balancer_ip" {
  name    = "${var.environment}-shopsphere-lb-ip"
  project = var.project_id
}

resource "google_compute_health_check" "http" {
  name    = "${var.environment}-shopsphere-http-health-check"
  project = var.project_id
  http_health_check {
    port         = 80
    request_path = "/"
  }
  check_interval_sec  = 10
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3
}

